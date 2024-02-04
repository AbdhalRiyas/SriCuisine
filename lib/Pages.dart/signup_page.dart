import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/signout_button.dart';
import 'package:flutter_application_1/components.dart/text_field.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();

  //user sign up method
  void signUpUser(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          const SizedBox(height: 50),

          //logo image

          Image.asset(
            'images/appLogo.jpg',
            height: 130,
          ),

          const SizedBox(height: 40),

          //account text

          const Text(
            "Create an Account !!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),

          //text fields
          //first name

          MyTextField(
              controller: firstnameController,
              hintText: "FirstName",
              obseureText: false,
            ),

            const SizedBox(height: 15),

          //last name

          MyTextField(
            controller: lastnameController,
            hintText: "LastName",
            obseureText: false,
          ),

          const SizedBox(height: 15),

          //email

          MyTextField(
            controller: emailcontroler,
            hintText: "email address",
            obseureText: false,
          ),

          const SizedBox(height: 15),

          //password

          MyTextField(
            controller: passwordcontroler,
            hintText: "Password",
            obseureText: true,
          ),

          //sign up button

          const SizedBox(height: 15),

          MyKey(
            onTap: signUpUser,
            ),
      
          //already have an account log in
          const SizedBox(height: 15),
          
          const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account ?"),
                SizedBox(width: 5,),
                Text(
                  "Sign in",
                style: TextStyle(
                  color: Colors.blue,fontWeight:FontWeight.bold ),
                  ),
              ],
            )

        ],
      ),
    );
  }
}
