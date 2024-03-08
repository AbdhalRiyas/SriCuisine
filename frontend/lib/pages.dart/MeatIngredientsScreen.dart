import 'package:flutter/material.dart';

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
  ];

  final List<int> _quantities = List.generate(6, (index) => (index + 1) * 100);

  int _selectedMeats = -1; // Initially no selection
  int? _selectedQuantity; // Initially null
  Map<int, int> _selectedItems =
      {}; // Map to store selected items and their quantities

  void _onMeatsTapped(int index) {
    setState(() {
      _selectedItems[_selectedMeats] = _selectedQuantity ?? 0;
      _selectedMeats = index;
      _selectedQuantity = _selectedItems[index];
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(_meats.length, (index) {
                final meat = _meats[index];
                final isSelected = _selectedMeats == index;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onMeatsTapped(index);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(
                                  0xFFE0E0E0) // Light gray for selection
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              // Subtle shadow
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1), // Offset for shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              meat,
                              style: TextStyle(
                                color: isSelected ? Colors.blue : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto', // Example custom font
                              ),
                            ),
                            if (isSelected)
                              DropdownButton<int>(
                                value: _selectedQuantity,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedQuantity = value;
                                  });
                                },
                                items: _quantities
                                    .map<DropdownMenuItem<int>>(
                                      (int value) => DropdownMenuItem<int>(
                                        value: value,
                                        child: Text('$value g'),
                                      ),
                                    )
                                    .toList(),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (isSelected && _selectedQuantity != null)
                      Text(
                        'Selected Quantity: $_selectedQuantity g',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    const SizedBox(height: 16), // Add space between items
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
