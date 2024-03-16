import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:iconsax/iconsax.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;
  final String title;
  final String thumbnailUrl;
  final String calorie;
  final String cookTime;
  final String servings;
  final String ingredients;
  final String instructions;

  const RecipeDetailPage(
      {Key? key,
      required this.recipe,
      required this.title,
      required this.thumbnailUrl,
      required this.calorie,
      required this.cookTime,
      required this.servings,
      required this.ingredients,
      required this.instructions})
      : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "${widget.title} ",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: const Text("Start Cooking"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Image.network(
                  //   widget.thumbnailUrl,
                  //   fit: BoxFit.cover,
                  // ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_fire_department,
                              color: Colors.red),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.recipe.cal} cal",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.clock, color: Colors.blue),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.recipe.time} min",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.user, color: Colors.green),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.recipe.servings} servings",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  // Removed the ingredients and instructions as there's no such properties in the widget
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.recipe.ingredients}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.recipe.instructions}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
