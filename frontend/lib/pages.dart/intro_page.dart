// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Image(
            image: AssetImage('images/appLogo.jpg'),
          ),

          //  child: Container(
          //   height : 300,
          //   width:300,
          //   decoration: BoxDecoration(
          //     color: Colors.deepPurple,
          //     borderRadius: BorderRadius.circular(20),
          //     ),

          // child:Text(
          //   "mitch",
          //   style: TextStyle(
          //     color:Colors.white,
          //     fontSize: 23,
          //     fontWeight: FontWeight.bold,
          //   ),

          // child:Icon(
          //   Icons.home,
          //   color: Colors.black,
          //   size:45,
          // ),
          // ),
          // ),
        )
    );
  }
}

 // home: Scaffold(