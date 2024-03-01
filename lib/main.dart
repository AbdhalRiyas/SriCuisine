// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages.dart/recipes_page.dart';
import 'package:flutter_application_1/Pages.dart/signup_page.dart';
import 'package:flutter_application_1/Pages.dart/login_page.dart';
import 'package:flutter_application_1/Pages.dart/intro_page.dart';
import 'package:flutter_application_1/Pages.dart/specification_page.dart';
import 'package:flutter_application_1/Pages.dart/available_ingredients_screen.dart';
import 'package:flutter_application_1/Pages.dart/FruitIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/DairyProductsIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/MeatIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/VegetableIngredientsScreen.dart';
import 'package:flutter_application_1/Pages.dart/tracker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvailableIngredientsScreen(),
      // VegetableIngredientsScreen(),
      // MeatIngredientsScreen(),
      // FruitIngredientsScreen(),
      // DairyProductsIngredientsScreen(),

      // RecipesPage(),
      // SpecPage(),
      // IntroPage(),
      // LoginPage(),
      // SignupPage(),
    );
  }
}
