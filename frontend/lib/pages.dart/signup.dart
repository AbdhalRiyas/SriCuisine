import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages.dart/login.dart';
import 'package:flutter_application_1/pages.dart/specification_page.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                  ),

                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),


            //text field topic display

              Column(
                children: <Widget>[
                  inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm Password ", obscureText: true),
                ],
              ),


              //signup button padding and edit

              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                ),

                //signup button Navigation

                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SpecPage()));
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),

                //signup button text

                  child: const Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  GestureDetector(
                  child:const Text(
                  " Log in",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),

                ),
                onTap : (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>LoginPage()));
                  },
                )
                ],
              )


            ],

          ),


        ),

      ),

    );
  }
}



//creating a widget for text field

Widget inputFile({label, obscureText = false})
{

  //label text style edit
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.black87
        ),

      ),

      const SizedBox( height: 5),  //text and text field between space

      //text fied edited stuff
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10), //text fild size
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 175, 165, 165)  // display border color
            ),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color:  Color.fromARGB(255, 172, 151, 151))  //when user clicked popup color
          )
        ),
      ),

      const SizedBox(height: 10,)  //text field between space

    ],
  );
}