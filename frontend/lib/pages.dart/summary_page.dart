import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Summary'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMI Summary',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'BMI: 24.5',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Status: Normal',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Description: Your BMI indicates that you have a healthy weight.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
