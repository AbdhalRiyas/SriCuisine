import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/pages/signup.dart'; // import the necessary page we want to do the testing of

void main() {
  testWidgets('SignupPage Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: SignupPage(),
    ));

    // Verify if the title is displayed correctly
    expect(find.text('SignUp  Form'), findsOneWidget);

    // Verify if the Username field is displayed correctly
    expect(find.text('UserName'), findsOneWidget);

    // Verify if the Email Address field is displayed correctly
    expect(find.text('Email Address'), findsOneWidget);

    // Verify if the Password field is displayed correctly
    expect(find.text('Password'), findsOneWidget);

    // Verify if the Sign up button is displayed correctly
    expect(find.text('Sign up'), findsOneWidget);

    // Verify if the "Already have an Account?" text is displayed correctly
    expect(find.text("Already have an Account?"), findsOneWidget);
    
  });
}
