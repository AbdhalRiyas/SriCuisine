import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class FruitIngredientsScreen extends StatefulWidget {
  @override
  _FruitIngredientsScreenState createState() => _FruitIngredientsScreenState();
}

class _FruitIngredientsScreenState extends State<FruitIngredientsScreen> {
  final List<String> _fruits = [
    'Apple',
    'Avocado',
    'Banana',
    'Blueberry',
    'Cactus fruit',
    'Cantaloupe',
    'Cherry',
    'Clementine',
    'Dates',
    'Eggplant',
    'Ginger Root',
    'Grape',
    'Grapefruit',
    'Guava',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mandarine',
    'Mango',
    'Mangostan',
    'Mulberry',
    'Nectarine',
    'Orange',
    'Papaya',
    'Passion fruit',
    'Peach',
    'Pears',
    'Pineapple',
    'Pomegranate',
    'Rambutan',
    'Raspberry',
    'Redcurrant',
    'Strawberry',
    'Watermelon',
  ];

  List<String> _selectedFruits = [];

  void _onFruitsSelected(String fruit) {
    setState(() {
      if (_selectedFruits.contains(fruit)) {
        _selectedFruits.remove(fruit);
      } else {
        _selectedFruits.add(fruit);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEB3B),
        title: const Text(
          'Fruits',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AvailableIngredientsScreen(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fruits',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Wrap the list of fruits into two columns
              Wrap(
                spacing: 20.0,
                runSpacing: 10.0,
                children: _fruits.map((fruit) {
                  final isSelected = _selectedFruits.contains(fruit);
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: (_) {
                            _onFruitsSelected(fruit);
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          fruit,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.black : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
