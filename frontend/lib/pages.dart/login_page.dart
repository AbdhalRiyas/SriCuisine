import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/squre_tile.dart';
import 'package:flutter_application_1/components.dart/sign_button.dart';
import 'package:flutter_application_1/components.dart/text_field.dart';
import 'package:flutter_application_1/Pages.dart/signup_page.dart';
import 'package:flutter_application_1/Pages.dart/forgotPassword_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            //logo

            // Icon(
            //   Icons.lock,
            //   size: 100,
            // ),
            Image.asset(
            'images/appLogo.jpg',
            height: 130,
            ),

            const SizedBox(height: 40),

            //welcome message
            const Text(
              "Let's Get Started !!",
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
              hintText: "Password",
              obseureText: true,
            ),

            //forgot password

            const SizedBox(height: 15),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child:const Text(
                    'forgot password',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap : (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>ForgotPassPage()));
                  },

                  )
                  
                ],
              ),
            ),


            //sign in button
            const SizedBox(height: 15),
            
            MyButton(
              onTap: signUserIn,
            ),

            //continue with
            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            //sign in options
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                //google button
                SqureTile(imagePath: 'images/googlepic.png'),

                SizedBox(width: 25,),

                //twiter button
                SqureTile(imagePath: 'images/twiter.png'),
              ],
            ),

            const SizedBox(height: 20),

            //Register to Application

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a Member ?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child:const Text(
                  "Register now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),

                ),
                onTap : (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>SignupPage()));
                  },
                )
              ],
            ),
           
            
          ],
        )
    );
  }
}