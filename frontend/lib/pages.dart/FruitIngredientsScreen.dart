import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class FruitIngredientsScreen extends StatefulWidget {
  @override
  _FruitIngredientsScreenState createState() => _FruitIngredientsScreenState();
}

class _FruitIngredientsScreenState extends State<FruitIngredientsScreen> {
  final List<String> _fruits = [
    'Apples',
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
    'Kiwi',
    'Mandarine',
    'Mango',
    'Mangostan',
    'Mulberry',
    'Nectarine',
    'Orange',
    'Papaya',
    'Passion fruit',
    'Peach',
    'Pear',
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
                ));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_selectedFruits.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue.withOpacity(0.2),
              child: Text(
                'Selected Fruits: ${_selectedFruits.join(",")}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _fruits.length,
              itemBuilder: (context, index) {
                final fruit = _fruits[index];
                final isSelected = _selectedFruits.contains(fruit);
                return InkWell(
                  onTap: () {
                    _onFruitsSelected(fruit);
                  },
                  child: Card(
                    color: isSelected
                        ? const Color.fromARGB(174, 255, 255, 255)
                        : Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
