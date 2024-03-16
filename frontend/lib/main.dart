
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages.dart/forgotPassword_page.dart';
import 'package:flutter_application_1/Pages.dart/signup_page.dart';
import 'package:flutter_application_1/Pages.dart/login_page.dart';
import 'package:flutter_application_1/Pages.dart/intro_page.dart';
import 'package:flutter_application_1/Pages.dart/specification_page.dart';
import 'package:flutter_application_1/Pages.dart/Available_ingredients_screen.dart';
import 'package:flutter_application_1/Pages.dart/FruitIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/StaplesIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/MeatIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/VegetableIngredientsScreen.dart';
import 'package:flutter_application_1/pages.dart/main_screen.dart';
import 'package:flutter_application_1/pages.dart/recipe_detail_page.dart';
import 'package:flutter_application_1/pages.dart/BMIScreen.dart';
import 'package:flutter_application_1/pages.dart/tracker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Times New Roman",
      ),
      debugShowCheckedModeBanner: false,
      home:
          // SpecPage(),
          // AvailableIngredientsScreen(),
          // VegetableIngredientsScreen(),
          // StaplesIngredientsScreen(),
          // MeatIngredientsScreen(),
          // FruitIngredientsScreen(),
          // BMIPageScreen(),

          //IntroPage(),
          //LoginPage(),
          //ForgotPassPage()
          MeatIngredientsScreen(),
    );
  }
}
