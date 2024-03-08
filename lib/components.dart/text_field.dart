// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obseureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obseureText,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller:controller ,
        obscureText: obseureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), //showing text field
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown) //clicked text field
              ),
          fillColor: const Color.fromARGB(255, 252, 251, 251),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
