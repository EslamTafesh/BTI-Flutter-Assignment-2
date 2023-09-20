import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/models/meal_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomModalSheetData extends StatefulWidget {

  CustomBottomModalSheetData({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomModalSheetData> createState() =>
      _CustomBottomModalSheetDataState();
}

class _CustomBottomModalSheetDataState
    extends State<CustomBottomModalSheetData> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery
        .of(context)
        .viewInsets
        .bottom != 0.0;

    return Consumer<MainScreenController>(
      builder: (BuildContext context, provider, child) {
        return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            height: MediaQuery
                .of(context)
                .size
                .height * 3 / 4,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ...provider.selectedMealInfo.mealComments?.map(
                          (e) =>
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          300.0),
                                      child: Image.network(
                                        e.userPhoto!,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Card(
                                  color: Colors.white.withOpacity(0.1),
                                  child: SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width - 95,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        top: 10.0),
                                                    child: Text(
                                                      e.userName!,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Text(
                                                    e.date!,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.more_vert),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            indent: 0,
                                            endIndent: 10,
                                          ),
                                          Text(
                                            e.comment!,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                    ) ?? [] ,
                  ],
                ),
              ),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom),
                height: 75,
                decoration: BoxDecoration(
                  color: Color(0xFF36363B),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 85,
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.only(start: 2, bottom: 0),
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Add a comment"),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {

                              provider.addNewComment(map:
                                  {
                                    "name":"Mike Ross",
                                    "photo":"https://cdn.discordapp.com/attachments/1008571122889011290/1075561465748131950/slashj2000_make_him_inteligente_864a8eeb-8865-486d-90d0-073ac25dc01f.png",
                                    "date":"12/8/2023",
                                    "comment":controller.text,

                                  } );
                            },
                            child: Icon(Icons.telegram, size: 36, weight: 40)),
                      ],
                    )),
              ),
            ));
      },
    );
  }
}
