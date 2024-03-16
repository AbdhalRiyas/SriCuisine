import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/recipe_card.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/pages.dart/recipe_detail_page.dart';

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
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(
                    recipe: recipes[index], title: ("${recipes[index].name}"), thumbnailUrl: ("${recipes[index].image}"), calorie: ("${recipes[index].cal}"), cookTime: ("${recipes[index].time}"), servings: ("${recipes[index].servings}"), ingredients: ("${recipes[index].ingredients}"), instructions: ("${recipes[index].instructions}")
                  ),
                ),
              );
            },
            child: RecipeCard(
              recipe: recipes[index],
              recipes: recipes[index],
              title: ("${recipes[index].name}"),
              thumbnailUrl: ("${recipes[index].image}"),
              calorie: ("${recipes[index].cal}"),
              cookTime: ("${recipes[index].time}"), 
            ),
          );
        },
      ),
    );
  }
}
