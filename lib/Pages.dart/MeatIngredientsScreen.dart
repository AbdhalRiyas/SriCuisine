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

  final List<int> _quantities = List.generate(6, (index) => index + 1);

  int _selectedMeat = 0;
  int _selectedQuantity = 1;

  void _onMeatTapped(int index) {
    setState(() {
      _selectedMeat = index;
      _selectedQuantity = 1; // Reset quantity when changing vegetables
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meat'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(_meats.length, (index) {
              final meat = _meats[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onMeatTapped(index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedMeat == index
                                ? Colors.blue
                                : Colors.grey,
                            width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        meat,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedMeat == index
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
