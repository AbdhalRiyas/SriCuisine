import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/squre_tile.dart';
import 'package:flutter_application_1/components.dart/reset_button.dart';
import 'package:flutter_application_1/components.dart/text_field.dart';
import 'package:flutter_application_1/Pages.dart/signup_page.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method

  void signUserIn() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'images/appLogo.jpg',
              height: 130,
            ),

            const SizedBox(height: 40),

            //welcome message
            const Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),

            //textfields
            MyTextField(
              controller: usernameController,
              hintText: "UserName",
              obseureText: false,
            ),

            const SizedBox(height: 15),

            MyTextField(
              controller: passwordController,
              hintText: "New Password",
              obseureText: true,
            ),

            //forgot password

            const SizedBox(height: 15),

            

            //sign in button
            const SizedBox(height: 15),

            MyButton(
              onTap: signUserIn,
            ),

            
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            const SizedBox(height: 20),  

           
          ],
        ));
  }
}
