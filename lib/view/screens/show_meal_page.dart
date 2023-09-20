import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/models/meal_info.dart';
import 'package:bti_project1/view/widgets/CustomBottomModalSheetData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowMealPage extends StatefulWidget {
  const ShowMealPage({super.key});

  @override
  State<ShowMealPage> createState() => _ShowMealPageState();
}

class _ShowMealPageState extends State<ShowMealPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, provider, child) {
        return Scaffold(
          body: ListView(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.15),
                        offset: Offset(0, 10),
                        blurRadius: 30)
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(20),
                          bottomEnd: Radius.circular(20),
                        ),
                      ),
                      child: Image.network(
                        provider.selectedMealInfo.img_url!,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.grey,
                                  minimumSize: Size(45, 45),
                                  maximumSize: Size(45, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  padding: EdgeInsets.zero),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.orange,
                                  minimumSize: Size(45, 45),
                                  maximumSize: Size(45, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  padding: EdgeInsets.zero),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.orange,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.black38),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15),
                                        child: Text(
                                          provider.selectedMealInfo.name!,
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w500,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.white,
                                                    blurRadius: 50,
                                                    offset: Offset(0, 0))
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                          end: 15,
                                        ),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white
                                                      .withOpacity(0.35),
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 15)
                                            ]),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.orange,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4.2",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 6),
                                        child: Align(
                                          alignment: AlignmentDirectional
                                              .centerStart,
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            alignment: WrapAlignment.start,
                                            children: provider
                                                    .selectedMealInfo.contents
                                                    ?.map(
                                                      (e) => Container(
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(end: 5),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 7,
                                                                vertical: 2),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            color: Colors
                                                                .white
                                                                .withOpacity(
                                                                    0.3)),
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
                                      TextButton(
                                        onPressed: () {
                                          openBottomSheet();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white10,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          minimumSize: Size(105, 35),
                                        ),
                                        child: Text(
                                          "Comments ${provider.selectedMealInfo.mealComments?.length ?? 0}",
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: Text(
                    "Try our classic Angus beef burger, cooked to perfection and topped with melted cheddar cheese, crispy bacon, and tangy barbecue sauce. Served with a side of golden fries for a delicious and satisfying meal.",
                    style: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 30,
                endIndent: 20,
                indent: 20,
                color: Colors.white12,
                thickness: 0.5,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.all(15),
                  child: Text(
                    "Size",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.orange,
                                minimumSize: Size(45, 45),
                                maximumSize: Size(45, 45),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.orange,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.zero),
                            child: Text("x1")),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1E1D1D),
                              foregroundColor: Colors.white60,
                              minimumSize: Size(45, 45),
                              maximumSize: Size(45, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.zero),
                          child: Text("x2"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1E1D1D),
                              foregroundColor: Colors.white60,
                              minimumSize: Size(45, 45),
                              maximumSize: Size(45, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.zero),
                          child: Text("x3"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 30,
                endIndent: 20,
                indent: 20,
                color: Colors.white12,
                thickness: 0.5,
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RichText(
                        textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Price\n",
                              style: TextStyle(
                                fontSize: 15,color: Colors.white60,
                              ),
                              children: [TextSpan(text: "\$ ",

                              style: TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,color: Colors.orange,
                              )
                              ),TextSpan(text: "${provider.selectedMealInfo.price!}.00",
                                  style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,color: Colors.white,
                                  ))],
                          ),),
                    ),
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            minimumSize: Size(45, 45),
                            maximumSize: Size(45, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.zero),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined),
                            SizedBox(width: 5,),
                            Text("Add to Cart"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) => CustomBottomModalSheetData(),
    );
  }
}
