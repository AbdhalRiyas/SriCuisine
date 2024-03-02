import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class IngredientsPage extends StatefulWidget {
  List<Ingredient> ingredients = <Ingredient>[];

  setIngredients(List<Ingredient> newIngredients) {
    setState(() {
      ingredients = newIngredients;
    });
  }

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
  
  void setState(Null Function() param0) {}
}

class _IngredientsPageState extends State<IngredientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
      ),
      body: ListView.builder(
        itemCount: widget.ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = widget.ingredients[index];
          return Card(
            child: ListTile(
              title: Text(ingredient.name),
              subtitle: Text('Expires on: ${ingredient.expirationDate}'),
            ),
          );
        },
      ),
    );
  }
}

class Ingredient {
  String name;
  DateTime expirationDate;

  Ingredient({required this.name, required this.expirationDate});
}