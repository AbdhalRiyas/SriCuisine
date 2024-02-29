import 'package:flutter/material.dart';

class AvailableIngredientsScreen extends StatefulWidget {
  @override
  _AvailableIngredientsScreenState createState() =>
      _AvailableIngredientsScreenState();
}

class _AvailableIngredientsScreenState
    extends State<AvailableIngredientsScreen> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    'Vegetables',
    'Meats',
    'Fruits',
    'Dairy Products',
  ];

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Ingredients'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_categories.length, (index) {
              final category = _categories[index];
              return GestureDetector(
                onTap: () {
                  _onCategoryTapped(index);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            _selectedIndex == index ? Colors.blue : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
