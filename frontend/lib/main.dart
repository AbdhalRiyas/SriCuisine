
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Times New Roman",
      ),
      debugShowCheckedModeBanner: false,
      home:
          IntroPage(),
    );
  }
}
