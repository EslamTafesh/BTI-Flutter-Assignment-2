import 'package:bti_project1/constants.dart';
import 'package:bti_project1/models/sidebar.dart';
import 'package:bti_project1/view/screens/favourite_page.dart';
import 'package:bti_project1/view/widgets/sidebar_row.dart';
import 'package:flutter/material.dart';


class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness != Brightness.dark ? kSidebarBackgroundColor : Color(
            0xFF1A1A1A),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.85,
      // padding: EdgeInsets.symmetric(
      //   vertical: 35.0,
      //   horizontal: 20.0,
      // ),
      child: Stack(
        children: [
          Padding(
            padding: orientation == Orientation.landscape ? EdgeInsets.zero : EdgeInsets.only(bottom: 60.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(

                    decoration: BoxDecoration(
                      color: Colors.black38
                    ),
                    accountName: Text("Eslam Tafesh"), accountEmail: Text("Eslam2000@gmail.com"), currentAccountPicture: Container(clipBehavior: Clip.antiAlias,decoration: BoxDecoration(

                    shape: BoxShape.circle
                  ),child: Image.network("https://images.unsplash.com/photo-1583262791902-40b478604213?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVyc29uJTIwYXQlMjBqb3B8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=300&q=60",fit: BoxFit.cover,),),),

                  Column(
                    children: [

                      SizedBox(
                        height: 80,
                        child: MaterialButton(
                          onPressed: (){},
                          child: SidebarRow(
                            item: sidebarItem[0],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritePage()));
                          },
                          child: SidebarRow(
                            item: sidebarItem[1],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                        child: MaterialButton(
                          onPressed: (){},
                          child: SidebarRow(
                            item: sidebarItem[2],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                        child: MaterialButton(
                          onPressed: (){},
                          child: SidebarRow(
                            item: sidebarItem[3],
                          ),
                        ),
                      ),


                      orientation == Orientation.landscape ?     SizedBox(
                        height: 80,
                        child: MaterialButton(
                          onPressed: (){},
                          child: SidebarRow(
                            item: sidebarItem[4],
                          ),
                        ),
                      ):SizedBox(),
                    ],
                  )
                ],
              ),
            ),
          ),
          orientation == Orientation.landscape ? SizedBox() :  PositionedDirectional(
            bottom: 10,
            start: 0,
            child: MaterialButton(
              onPressed: (){},
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Log out",
                    style: kSecondaryCalloutLabelStyle,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(Icons.logout)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
