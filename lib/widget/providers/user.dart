import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String _role;
  String _token;
  String _name;

  String get role => _role;
  String get token => _token;
  String get name => _name;

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
