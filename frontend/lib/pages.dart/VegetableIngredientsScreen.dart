import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class VegetableIngredientsScreen extends StatefulWidget {
  @override
  _VegetableIngredientsScreenState createState() =>
      _VegetableIngredientsScreenState();
}

class _VegetableIngredientsScreenState
    extends State<VegetableIngredientsScreen> {
  final List<String> _vegetables = [
    'Mushrooms',
    'Raddish',
    'Cauliflower',
    'Broccoli',
    'Egg-plant',
    'Spinach',
    'Cucumber',
    'Bell Pepper',
    'Bitter-Gourd',
    'Tomatoes',
    'Carrots',
    'Green Beans',
    'Pumpkin',
    'Cabbage',
    'Potatoes',
    'Coriander',
  ];

  List<String> _selectedVegetables = [];

  void _onVegetablesSelected(String vegetable) {
    setState(() {
      if (_selectedVegetables.contains(vegetable)) {
        _selectedVegetables.remove(vegetable);
      } else {
        _selectedVegetables.add(vegetable);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEB3B),
        title: const Text(
          'Vegetables',
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vegetables',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.0,
              runSpacing: 10.0,
              children: _vegetables.map((vegetable) {
                final isSelected = _selectedVegetables.contains(vegetable);
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 -
                      30, // Adjust width as needed
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          _onVegetablesSelected(vegetable);
                        },
                        activeColor: Colors.blue,
                      ),
                      Text(
                        vegetable,
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
    );
  }
}
