import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart'; // Import your user model

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
