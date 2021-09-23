import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String _role;
  String _token;

  String get role => _role;
  String get token => _token;

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}
