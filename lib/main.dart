import 'package:bti_project1/controller/main_screen_controller.dart';
import 'package:bti_project1/view/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


void main() {
  bool isDark = true;
  runApp(
      MultiProvider(providers: [

        ChangeNotifierProvider(create: (context)=> MainScreenController()),

      ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
        ),

        home: HomePage(),
      ),)
  );
}
