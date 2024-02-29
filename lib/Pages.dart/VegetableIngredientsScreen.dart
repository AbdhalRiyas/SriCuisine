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

  final List<int> _quantities = List.generate(6, (index) => index + 1);

  int _selectedVegetable = 0;
  int _selectedQuantity = 1;

  void _onVegetableTapped(int index) {
    setState(() {
      _selectedVegetable = index;
      _selectedQuantity = 1; // Reset quantity when changing vegetables
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(_vegetables.length, (index) {
              final vegetable = _vegetables[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onVegetableTapped(index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedVegetable == index
                                ? Colors.blue
                                : Colors.grey,
                            width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        vegetable,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedVegetable == index
                              ? Colors.blue
                              : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<int>(
                    value: _selectedQuantity,
                    onChanged: (value) {
                      setState(() {
                        _selectedQuantity;
                      });
                    },
                    items: _quantities
                        .map((quantity) => DropdownMenuItem<int>(
                              value: quantity,
                              child: Text('$quantity kg'),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
