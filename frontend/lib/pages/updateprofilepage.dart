import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/UserApi.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heightController.text = UserApi.user.height.toString();
    weightController.text = UserApi.user.weight.toString();
    ageController.text = UserApi.user.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.yellow,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit),
              SizedBox(width: 10),
              Text('Edit Profile')
            ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: ClipRect(
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              Text(UserApi.user.userName.toString(),
                  style: const TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25)),
              Text(UserApi.user.email.toString(),
                  style: const TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15)),
              const SizedBox(height: 20),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: heightController,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.orange[50],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: weightController,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.orange[50],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.orange[50],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      UserApi.updateUserDetails(
                          context: context,
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          age: int.parse(ageController.text));
                    },
                    child: const Text('Save',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 65),
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}