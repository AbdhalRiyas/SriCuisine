import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/recipe_card.dart';
import 'package:flutter_application_1/models/recipe.dart';

class RecipesPage extends StatefulWidget {
  @override
  _Recipes createState() => _Recipes();
}

class _Recipes extends State<RecipesPage> {
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
              title: "Noodles", cookTime: "15", calorie: "145", thumbnailUrl: ""
              // "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Mama_instant_noodle_block.jpg/800px-Mama_instant_noodle_block.jpg",
              ),
          RecipeCard(
              title: "Pasta", cookTime: "20", calorie: "200", thumbnailUrl: ""
              //"https://images.immediate.co.uk/production/volatile/sites/30/2013/05/Puttanesca-fd5810c.jpg?quality=90&webp=true&resize=375,341",
              ),
          RecipeCard(
            title: "Pizza",
            cookTime: "30",
            calorie: "300",
            thumbnailUrl: "https://www.thespruceeats.com/thmb/",
          ),
          RecipeCard(
              title: "Burger",
              cookTime: "25",
              calorie: "250",
              thumbnailUrl: "https://www.thespruceeats.com/thmb/"),
        ],
      ),
    );
  }
}
