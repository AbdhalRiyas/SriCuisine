import 'package:flutter/material.dart';

class  HomePage extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State< HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 10),
              Text('Home')
            ]),
      ),
      body: const Center(
        child: Text(
          'Welcome to SriCuisine',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
