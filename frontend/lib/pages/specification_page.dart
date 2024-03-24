import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/UserApi.dart';

class SpecPage extends StatefulWidget {
  //const SpecPage({Key? key});

  @override
  State<SpecPage> createState() => _SpecPageState();
}

class _SpecPageState extends State<SpecPage> {
  final _formfield = GlobalKey<FormState>();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  List<String> allergens = [];

  bool passToggle = true;

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
      "name": "Tree Nuts",
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

  // void saveUserIn() {}

  // double _height = 0.0;
  // double _weight = 0.0;
  // int _age = 0;
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
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formfield,
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
                            if (allergens
                                .contains(subj["name"].toLowerCase())) {
                              allergens.remove(subj["name"].toLowerCase());
                            } else {
                              allergens.add(subj["name"].toLowerCase());
                            }
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

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // onChanged: (value) {
                  //   setState(() {
                  //     _height = double.tryParse(value) ?? 0.0;
                  //   });
                  // },
                  validator: (value) {
                    bool heightValid = RegExp(r'^\d{2,3}$').hasMatch(value!);

                    if (value.isEmpty) {
                      return "Enter user Height";
                    } else if (!heightValid) {
                      return "Enter Valid user Height";
                    }
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // onChanged: (value) {
                  //   setState(() {
                  //     _weight = double.tryParse(value) ?? 0.0;
                  //   });
                  // },

                  validator: (value) {
                    bool weightValid = RegExp(r'^\d{2,3}$').hasMatch(value!);

                    if (value.isEmpty) {
                      return "Enter user Weight";
                    } else if (!weightValid) {
                      return "Enter Valid user Weight";
                    }
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age (years)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // suffix: InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //       passToggle = !passToggle;
                    //     });
                    //   },
                    // )
                  ),

                  // onChanged: (value) {
                  //   setState(() {
                  //     _age = int.tryParse(value) ?? 0;
                  //   });
                  // },

                  validator: (value) {
                    bool ageValid =
                        RegExp(r'^(?:[1-9][0-9]?|100)$').hasMatch(value!);

                    if (value.isEmpty) {
                      return "Enter user Age";
                    } else if (!ageValid) {
                      return "Enter Valid user Age";
                    }
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

                // Center(
                //   child: CustomSaveButton(
                //     onTap: saveUserIn,
                //   ),
                // ),

                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      print(allergens);
                      UserApi.updateUser(
                        context: context,
                        allergens: allergens,
                        height: double.parse(heightController.text),
                        weight: double.parse(weightController.text),
                        age: int.parse(ageController.text),
                        userId: UserApi.userId,
                      );
                    }
                  },

                  //button editing

                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
