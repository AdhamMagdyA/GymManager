import 'package:flutter/cupertino.dart';

class Global with ChangeNotifier {
  static String _token;
  static void set(String s) => _token = s;
  static String get token => _token;
}
