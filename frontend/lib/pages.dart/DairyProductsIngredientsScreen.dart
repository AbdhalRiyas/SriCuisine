import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class DairyProductsIngredientsScreen extends StatefulWidget {
  @override
  _DairyProductsIngredientsScreenState createState() =>
      _DairyProductsIngredientsScreenState();
}

class _DairyProductsIngredientsScreenState
    extends State<DairyProductsIngredientsScreen> {
  final List<String> _staples = [
    'Milk',
    'Butter',
    'Cream',
    'Yoghurt',
    'Cheese',
    'Custard',
    'Ghee',
  ];

  List<String> _selectedStaples = [];

  void _onStaplesSelected(String staple) {
    setState(() {
      if (_selectedStaples.contains(staple)) {
        _selectedStaples.remove(staple);
      } else {
        _selectedStaples.add(staple);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEB3B), // Light gray background
        title: const Text(
          'Staples',
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
          if (_selectedStaples.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue.withOpacity(0.2),
              child: Text(
                'Selected Staples: ${_selectedStaples.join(",")}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _staples.length,
              itemBuilder: (context, index) {
                final staple = _staples[index];
                final isSelected = _selectedStaples.contains(staple);
                return GestureDetector(
                  onTap: () {
                    _onStaplesSelected(staple);
                  },
                  child: Card(
                    color: isSelected
                        ? const Color.fromARGB(255, 180, 180, 117)
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
                      child: Text(
                        staple,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
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
