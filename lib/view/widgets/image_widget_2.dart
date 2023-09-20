import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/models/meal_info.dart';
import 'package:bti_project1/view/screens/show_meal_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget2 extends StatefulWidget {
  MealInfo mealInfo;
  bool isLoved = false;
  bool showComment = false;

  Function openBottomSheet;

  ImageWidget2({required this.mealInfo, required this.openBottomSheet});

  @override
  State<ImageWidget2> createState() => _ImageWidget2State();
}

class _ImageWidget2State extends State<ImageWidget2> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, provider, child) {
        return  Card(
          elevation: 0,
          color: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: InkWell(
            onTap: (){
              provider.setSelectedMealInfo(widget.mealInfo);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowMealPage()));

            },
            child: SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          Image.network(
                            widget.mealInfo.img_url ?? "",
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            width: 150,
                            height: 120,
                          ),
                          PositionedDirectional(
                            end: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(10),
                                      bottomStart: Radius.circular(10))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "4.2",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "${widget.mealInfo.name}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "\$ ${widget.mealInfo.price}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            alignment: WrapAlignment.start,
                            children: widget.mealInfo.contents
                                ?.map(
                                  (e) => Container(
                                margin: EdgeInsetsDirectional.only(end: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white.withOpacity(0.3)),
                                child: Text(
                                  "${e.name}",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                                .toList() ??
                                [],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: InkWell(
                              onTap: () {
                                setState(() {

                                  provider.setMealFavourite(widget.mealInfo);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: widget.mealInfo.isFavourite! ? Colors.red : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: TextButton(
                                onPressed: (){
                                  provider.setSelectedMealInfo(widget.mealInfo);
                                  widget.openBottomSheet();
                                },
                                child: Text("Comments ${widget.mealInfo.mealComments?.length ?? 0}"),
                              )
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
