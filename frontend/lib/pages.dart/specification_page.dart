import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/save_button.dart';

class SpecPage extends StatefulWidget {
  const SpecPage({super.key});

  @override
  State<SpecPage> createState() => _SpecPageState();
}

class _SpecPageState extends State<SpecPage> {
  //checkbox
  List<Map> availableSpecification = [
    {"name": "Dairy", "isChecked": false},
    {"name": "Gluten", "isChecked": false},
    {"name": "Egg", "isChecked": false},
    {"name": "Peanuts", "isChecked": false},
    {"name": "Tree nuts", "isChecked": false},
    {"name": "Shellfish", "isChecked": false},
  ];


  //save button details

  void saveUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text("Allergies / Dietory restrictions"),
          backgroundColor: Colors.orange,
        ),

        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "Choose Your Subject",
                  //   style: TextStyle(fontSize: 20),
                  // ),

                  const SizedBox(height: 10,),

                  const Divider(),

                  const SizedBox(height: 10,),

                  //add checksbox here..

                  Column(
                      children: availableSpecification.map((subj) {
                    return CheckboxListTile(
                        value: subj["isChecked"],
                        title: Text(subj["name"],),
                        onChanged: (newValue) {
                          setState(() {
                            subj["isChecked"] = newValue;
                          });
                        });
                  }).toList()),

                  //display the result
                  const SizedBox(
                    height: 10,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 10,
                  ),

                  Wrap(
                    children: availableSpecification.map((subj) {
                      if (subj["isChecked"] == true) {
                        return Card(
                          elevation: 3,
                          color: Colors.white,
                          child: Padding(
                            padding:const  EdgeInsets.all(10),
                            child: Text(subj["name"]),
                          ),
                        );
                      }
                      return Container();
                    }).toList(),
                  ),

                  //add save button

                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 20,),
                  MyButton(
                    onTap: saveUserIn,
                  ),
                  
              ],

              )
              ),

               

        )
        );
  }
}
