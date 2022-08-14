import 'package:flutter/material.dart';
import 'package:flutter_application_1/modeles/User.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  } 
}
