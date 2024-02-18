import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/recipe_card.dart';

class Recipes extends StatefulWidget {
  @override
  _Recipes createState() => _Recipes();
}

class _Recipes extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Recommended Recipes')
        ]),
      ),
      body: ListView(
        children: [
          RecipeCard(
            title: "Noodles",
            cookTime: "15 Mins",
            calorie: "145",
            thumbnailUrl: "thumbnailUrl1",
          ),
          RecipeCard(
            title: "Pasta",
            cookTime: "20 Mins",
            calorie: "200",
            thumbnailUrl: "thumbnailUrl2",
          ),
        ],
      ),
    );
  }
}

