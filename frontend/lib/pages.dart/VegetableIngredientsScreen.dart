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
    'Egg-plant'
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
                ));
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_selectedVegetables.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue.withOpacity(0.2),
              child: Text(
                'Selected Vegetables: ${_selectedVegetables.join(",")}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _vegetables.length,
              itemBuilder: (context, index) {
                final vegetable = _vegetables[index];
                final isSelected = _selectedVegetables.contains(vegetable);
                return InkWell(
                  onTap: () {
                    _onVegetablesSelected(vegetable);
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
