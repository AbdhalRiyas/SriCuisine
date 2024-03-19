import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';

class StaplesIngredientsScreen extends StatefulWidget {
  @override
  _StaplesIngredientsScreenState createState() =>
      _StaplesIngredientsScreenState();
}

class _StaplesIngredientsScreenState extends State<StaplesIngredientsScreen> {
  final List<String> _staples = [
    'Gram Flour',
    'Wheat Flour',
    'Rice Flour',
    'Rice',
    'Noodle',
    'Dhal',
    'Ghee',
    'Milk',
    'Nuts',
    'Eggs',
    'Chickpeas',
    'Greenpeas',
  ];

  List<Map<String, dynamic>> _selectedStaples = [];

  void _onStaplesSelected(String staple) async {
    DateTime? pickedDate = await _selectDate(context);
    if (pickedDate != null) {
      setState(() {
        bool alreadySelected =
            _selectedStaples.any((item) => item['staple'] == staple);
        if (alreadySelected) {
          _selectedStaples.firstWhere(
              (item) => item['staple'] == staple)['date'] = pickedDate;
        } else {
          _selectedStaples.add({'staple': staple, 'date': pickedDate});
        }
      });
    }
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
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
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue.withOpacity(0.2),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _selectedStaples.map<Widget>((staple) {
                  return Chip(
                    label: Text(
                      '${staple['staple']}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    onDeleted: () {
                      setState(() {
                        _selectedStaples.removeWhere((item) => item == staple);
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _staples.length,
              itemBuilder: (context, index) {
                final staple = _staples[index];
                return GestureDetector(
                  onTap: () {
                    _onStaplesSelected(staple);
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    color:
                        _selectedStaples.any((item) => item['staple'] == staple)
                            ? const Color.fromARGB(174, 255, 255, 255)
                            : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _selectedStaples
                                    .any((item) => item['staple'] == staple),
                                onChanged: (selected) {
                                  if (selected != null && selected) {
                                    _onStaplesSelected(staple);
                                  } else {
                                    setState(() {
                                      _selectedStaples.removeWhere(
                                          (item) => item['staple'] == staple);
                                    });
                                  }
                                },
                              ),
                              Text(
                                staple,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (_selectedStaples
                              .any((item) => item['staple'] == staple))
                            TextButton(
                              onPressed: () {
                                _onStaplesSelected(staple);
                              },
                              child: Text(
                                _selectedStaples
                                    .firstWhere((item) =>
                                        item['staple'] == staple)['date']
                                    .toString()
                                    .substring(0, 10),
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
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
