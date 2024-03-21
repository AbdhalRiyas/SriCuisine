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
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meats',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.0,
              runSpacing: 10.0,
              children: _meats.map((meat) {
                final isSelected = _selectedMeats.contains(meat);
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 -
                      30, // Adjust width as needed
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          _onMeatsSelected(meat);
                        },
                        activeColor: Colors.blue,
                      ),
                      Text(
                        meat,
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
