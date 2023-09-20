import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/models/meal_info.dart';
import 'package:bti_project1/view/widgets/CustomBottomModalSheetData.dart';
import 'package:bti_project1/view/widgets/image_widget_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
      builder: (BuildContext context, provider , child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Favourite Meals"),
          ),
          body: ListView(
            children: [
              ...provider.getAllFavMeals()
                  .map((e) => ImageWidget2(
                mealInfo: MealInfo(e),
                openBottomSheet: openBottomSheet,
              ))
                  .toList(),
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
