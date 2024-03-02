import 'package:flutter/material.dart';

class VegetableIngredientsScreen extends StatefulWidget {
  @override
  _VegetableIngredientsScreenState createState() =>
      _VegetableIngredientsScreenState();
}

class _VegetableIngredientsScreenState
    extends State<VegetableIngredientsScreen> {
  final List<String> _vegetables = [
    'Lettuce',
    'Tomatoes',
    'Cucumbers',
    'Carrots',
    'Broccoli',
    'Spinach',
    'Potatoes',
    'Beans',
    'Beatroots',
  ];

  final List<int> _quantities = List.generate(6, (index) => (index + 1) * 100);

  int _selectedVegetables = -1; // Initially no selection
  int? _selectedQuantity; // Initially null
  Map<int, int> _selectedItems =
      {}; // Map to store selected items and their quantities

  void _onVegetablesTapped(int index) {
    setState(() {
      _selectedItems[_selectedVegetables] = _selectedQuantity ?? 0;
      _selectedVegetables = index;
      _selectedQuantity = _selectedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFEB3B),
        title: const Text(
          'Vegetables',
          style: TextStyle(color: Colors.grey),
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
              children: List.generate(_vegetables.length, (index) {
                final vegetable = _vegetables[index];
                final isSelected = _selectedVegetables == index;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onVegetablesTapped(index);
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
                              vegetable,
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
