import 'package:flutter/cupertino.dart';

class Global with ChangeNotifier {
  static String _token;
  static String userName;
  static void set(String s) => _token = s;
  static void setUserName(String name) => userName = name;
  static String get token => _token;
  static String get username => userName;
}
