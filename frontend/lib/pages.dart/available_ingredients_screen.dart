import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/VegetableIngredientsScreen.dart';
import 'package:flutter_application_1/pages.dart/FruitIngredientsScreen.dart';
import 'package:flutter_application_1/pages.dart/MeatIngredientsScreen.dart';
import 'package:flutter_application_1/pages.dart/DairyProductsIngredientsScreen.dart';

class AvailableIngredientsScreen extends StatefulWidget {
  @override
  _AvailableIngredientsScreenState createState() =>
      _AvailableIngredientsScreenState();
}

class _AvailableIngredientsScreenState
    extends State<AvailableIngredientsScreen> {
  int _selectedIndex = -1;

  final List<String> _categories = [
    'Vegetables',
    'Meats',
    'Fruits',
    'Staples',
  ];

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_categories[index]) {
      case 'Vegetables':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VegetableIngredientsScreen()));
        break;
      case 'Meats':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MeatIngredientsScreen()));
        break;
      case 'Fruits':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FruitIngredientsScreen()));
        break;
      case 'Staples':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DairyProductsIngredientsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(CupertinoIcons.square_grid_2x2_fill),
          SizedBox(width: 10),
          Text('Available Ingredients')
        ]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_categories.length, (index) {
              final category = _categories[index];
              final isSelected = _selectedIndex == index;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onCategoryTapped(index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(
                                0xFFE0E0E0) // Light gray for selection
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.blue : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto', // Example custom font
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              //  submit function
            },
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
