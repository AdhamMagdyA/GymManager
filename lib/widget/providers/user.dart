import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String _role;

  String get role => _role;

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }
}
