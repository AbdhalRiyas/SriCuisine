import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages.dart/login.dart';
import 'package:flutter_application_1/Pages.dart/otpverify.dart';
import 'package:flutter_application_1/pages.dart/signup.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  final _formfield = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("SignUp  Form"),
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
                    // Image.asset("images/whiteLogo.jpg",
                    // height: 150,
                    // width: 200,
                    // ),
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

                    //email validation

                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Email Address",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r'^([a-zA-Z0-9_\.-]+)@([a-zA-Z0-9_\.-]+)\.([a-zA-Z]{2,6})$')
                              .hasMatch(value!);

                          if (value.isEmpty) {
                            return "Enter emailaddress";
                          } else if (!emailValid) {
                            return "Enter Valid emailAddress";
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

                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print("Data Addeed Successfully");
                          usernameController.clear();
                          emailController.clear();
                          passController.clear();
                        }
                      },

                      //button editing

                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //dont have an account text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account?"),
                        GestureDetector(
                          child: const Text(
                            " Log in",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext) => Login()));
                          },
                        )
                      ],
                    ),

                    const SizedBox(height: 5),
                  ],
                )),
          ),
        ));
  }
}
