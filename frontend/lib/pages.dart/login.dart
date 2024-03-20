import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/otpverify.dart';
import 'package:flutter_application_1/pages.dart/main_screen.dart';
import 'package:flutter_application_1/pages.dart/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Form(
                key: _formfield,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/whiteLogo.jpg",
                    height: 150,
                    width: 200,
                    ),
                    const SizedBox(height: 10),

                    // Username Validate part

                    TextFormField(
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: "UserName",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person)
                        ),
                        validator: (value) {
                          bool userNameValid =
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value!);

                          if (value.isEmpty) {
                            return "Enter userName";

                          } else if (!userNameValid) {
                            return "Enter Valid UserName";
                          }
                        }),

                    const SizedBox(
                      height: 20,
                    ),

                    // Password Validate part

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (passController.text.length < 6) {
                          return "Password length should not be more than 6 Characters";
                        }
                      },
                    ),

                    const SizedBox(height: 30),

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              'forgot password',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext) => OtpPage()));
                            },
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print("Data Addeed Successfully");
                          usernameController.clear();
                          passController.clear();

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>MainScreen()));
                        }
                         
                      },

                      //button editing

                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child:const  Center(
                            child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),

                    const SizedBox(height: 25,),

                    //dont have an account text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Don't have an account?"),
                        GestureDetector(
                          child: const Text(
                            "  Sign Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext) => SignupPage()));
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 5),
                  ],
                )
              ),
          ),
        )
        
      );
  }
}
       



                   