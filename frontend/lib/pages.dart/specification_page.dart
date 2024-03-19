import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/save_button.dart';

class SpecPage extends StatefulWidget {
  const SpecPage({Key? key});

  @override
  State<SpecPage> createState() => _SpecPageState();
}

class _SpecPageState extends State<SpecPage> {
  //checkbox
  List<Map<String, dynamic>> availableSpecification = [
    {
      "name": "Dairy",
      "description": "Includes milk and milk-based products",
      "isChecked": false
    },
    {
      "name": "Gluten",
      "description": "Found in wheat, rye, barley, and their derivatives",
      "isChecked": false
    },
    {
      "name": "Egg",
      "description": "Refers to egg and egg-based products",
      "isChecked": false
    },
    {
      "name": "Peanuts",
      "description": "Includes peanuts and peanut-based products",
      "isChecked": false
    },
    {
      "name": "Tree nuts",
      "description":
          "Includes various tree nuts such as almonds, walnuts, etc.",
      "isChecked": false
    },
    {
      "name": "Shellfish",
      "description": "Refers to shellfish and shellfish-based products",
      "isChecked": false
    },
  ];

  //save button details

  void saveUserIn() {}

  double _height = 0.0;
  double _weight = 0.0;
  int _age = 0;
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Allergies / Dietary restrictions",
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Select Your Allergies",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: availableSpecification.map((subj) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Card(
                      elevation: 3,
                      color: Colors.grey[200], // Grey color for card
                      child: CheckboxListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        value: subj["isChecked"],
                        title: Text(
                          subj["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          subj["description"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            subj["isChecked"] = newValue;
                          });
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              // const Divider(height: 5),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  " Height,Weight & Age",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Wrap(
                children: availableSpecification.map((subj) {
                  if (subj["isChecked"] == true) {}
                  return Container();
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _height = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _weight = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age (years)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _age = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<String>(
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomSaveButton(
                  onTap: saveUserIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Save Button Widget
class CustomSaveButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomSaveButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Save',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
