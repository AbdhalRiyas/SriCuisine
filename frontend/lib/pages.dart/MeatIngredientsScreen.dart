import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class MeatIngredientsScreen extends StatefulWidget {
  @override
  _MeatIngredientsScreenState createState() => _MeatIngredientsScreenState();
}

class _MeatIngredientsScreenState extends State<MeatIngredientsScreen> {
  final List<String> _meats = [
    'Chicken',
    'Pork',
    'Mutton',
    'Fish',
    'Beef',
    'Lamb',
    'Turkey',
    'Prawns',
    'Crab',
    'Clamps',
  ];

  List<String> _selectedMeats = [];

  void _onMeatsSelected(String meat) {
    setState(() {
      if (_selectedMeats.contains(meat)) {
        _selectedMeats.remove(meat);
      } else {
        _selectedMeats.add(meat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEB3B),
        title: const Text(
          'Meats',
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
          if (_selectedMeats.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue.withOpacity(0.2),
              child: Text(
                'Selected Meats: ${_selectedMeats.join(",")}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _meats.length,
              itemBuilder: (context, index) {
                final meat = _meats[index];
                final isSelected = _selectedMeats.contains(meat);
                return GestureDetector(
                  onTap: () {
                    _onMeatsSelected(meat);
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
                        meat,
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
