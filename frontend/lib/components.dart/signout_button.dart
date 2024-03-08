import 'package:flutter/material.dart';

class MyKey extends StatelessWidget {
  final Function()? onTap;

  const MyKey({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
        borderRadius:BorderRadius.circular(10) ),
        child: const Center(child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
          
          )
          ),
      ),
    );
  }
}