import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/models/meal_info.dart';
import 'package:bti_project1/view/screens/cart_page.dart';
import 'package:bti_project1/view/screens/sidebar_screen.dart';
import 'package:bti_project1/view/widgets/CustomBottomModalSheetData.dart';
import 'package:bti_project1/view/widgets/image_widget_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  String? category;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool bottomSheetOpened = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, provider, child) {
        return Scaffold(
          drawer: SidebarScreen(),
          bottomSheet: bottomSheetOpened
              ? BottomSheet(
                  onClosing: () {
                    Navigator.pop(context);
                  },
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                    );
                  },
                )
              : null,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Meals"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 60,
            leading: Builder(
              builder: (context) {
                return Padding(
                  padding:  EdgeInsetsDirectional.only(start: 15.0,top: 5,bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                    Scaffold.of(context).openDrawer();
                      },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      foregroundColor: Color(0xFF989898),
                      minimumSize: Size(40, 40),
                        maximumSize: Size(40, 40),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                );
              }
            ),

            actions: [
              Padding(
                padding:  EdgeInsetsDirectional.only(end: 15.0,top: 5,bottom: 5,),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.orange,
                      minimumSize: Size(45, 50),
                      maximumSize: Size(45, 50),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ],
          ),
          body: ListView(children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Find the best",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Meal for you",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                minVerticalPadding: 3,
                leading: Icon(Icons.restaurant_rounded),
                title: TextField(
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Find Your Meal...",
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: (){
                        widget.category =null;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          backgroundColor:  widget.category == null ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color:  widget.category == null ? Colors.white : Colors.transparent,
                            )
                          )
                      ),
                      child: Text("All",style: TextStyle(
                        color:  widget.category == null ?Colors.white : Colors.black,
                      ),),
                    ),
                  ),

                    ...provider.category.map((e) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: (){
                          widget.category =e["name"];
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            backgroundColor:  widget.category == e["name"] ? Colors.black: e["color"] ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: e["color"],
                            )
                          )
                        ),
                        child: Text(e["name"],style: TextStyle(
                          color: widget.category == e["name"] ? e["color"] : Colors.black,
                        ),),
                      ),
                    ),).toList(),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  if(  widget.category != null )
                  ...provider.mealsData.where((element) => element["category"] == widget.category)
                      .map((e) => ImageWidget2(
                            mealInfo: MealInfo(e),
                            openBottomSheet: openBottomSheet,
                          ))
                      .toList()
                  else
                  ...provider.mealsData
                      .map((e) => ImageWidget2(
                    mealInfo: MealInfo(e),
                    openBottomSheet: openBottomSheet,
                  ))
                      .toList(),
                ],
              ),
            )
          ]
              // imageData
              //     .map(
              //       (e) => ImageWidget(
              //         imageUrl: e["img_url"],
              //         country: e["name"],
              //         name: e["city"],
              //       ),
              //     )
              //     .toList(),
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
