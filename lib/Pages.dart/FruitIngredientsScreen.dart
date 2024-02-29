import 'package:flutter/material.dart';

class FruitIngredientsScreen extends StatefulWidget {
  @override
  _FruitIngredientsScreenState createState() => _FruitIngredientsScreenState();
}

class _FruitIngredientsScreenState extends State<FruitIngredientsScreen> {
  final List<String> _Fruits = [
    'Apples',
    'Apricot',
    'Avocado',
    'Banana',
    'Blueberry',
    'Cactus fruit',
    'Cantaloupe',
    'Carambula',
    'Cherry',
    'Cherry Wax',
    'Chestnut',
    'Clementine',
    'Cocos',
    'Dates',
    'Eggplant',
    'Fig',
    'Ginger Root',
    'Granadilla',
    'Grape',
    'Grapefruit',
    'Guava',
    'Hazelnut',
    'Huckleberry',
    'Kiwi',
    'Kaki',
    'Kohlrabi',
    'Kumsquats',
    'Lychee',
    'Mandarine',
    'Mango',
    'Mangostan',
    'Maracuja',
    'Mulberry',
    'Nectarine',
    'Nut',
    'Orange',
    'Papaya',
    'Passion fruit',
    'Peach',
    'Pepino',
    'Pear',
    'Physalis',
    'Pineapple',
    'Pitahaya Red',
    'Plum',
    'Pomegranate',
    'Pomelo Sweetie',
    'Quince',
    'Rambutan',
    'Raspberry',
    'Redcurrant',
    'Salak',
    'Strawberry',
    'Tamarillo',
    'Walnut',
    'Watermelon',
  ];

  final List<int> _quantities = List.generate(6, (index) => (index + 1) * 100);

  int _selectedFruit = 0; // Initially no selection
  int? _selectedQuantity; // Initially null
  Map<int, int> _selectedItems =
      {}; // Map to store selected items and their quantities

  void _onFruitTapped(int index) {
    setState(() {
      _selectedItems[_selectedFruit] = _selectedQuantity ?? 0;
      _selectedFruit = index;
      _selectedQuantity = _selectedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fruits',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFFFEB3B), // Light gray background
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(_Fruits.length, (index) {
                final dairyProduct = _Fruits[index];
                final isSelected = _Fruits == index;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onFruitTapped(index);
                      },
                      child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFFE0E0E0) // Light gray for selection
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              // Subtle shadow
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 1), // Offset for shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dairyProduct,
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    SizedBox(height: 16), // Add space between items
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
