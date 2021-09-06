import 'package:flutter/material.dart';

abstract class AppColor {
  static Color get pColor => const Color(0xFFFFCE2B);
  static Color get sColor => const Color(0xFF232441);
  static Color get tColor => const Color(0xFF131429);
}

abstract class AppTextStyle {
  static TextStyle get body10 => const TextStyle(fontSize: 10);
  static TextStyle get body12 => const TextStyle(fontSize: 12);
  static TextStyle get body14 => const TextStyle(fontSize: 14);
  static TextStyle get body16 => const TextStyle(fontSize: 16);
  static TextStyle get body20 => const TextStyle(fontSize: 20);
  static TextStyle get title30 =>
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle get btnText =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle get headline32 => const TextStyle(
      fontSize: 40, fontFamily: 'Changa', letterSpacing: 3.0, color: Colors.white);
  static TextStyle get headline50 => TextStyle(
        fontSize: 50,
        fontFamily: 'ProximaNova',
        fontWeight: FontWeight.bold,
      );
}

abstract class PadRadius {
  static double get radius => 50.0;
  static double get vertical => 20.0;
  static double get horizontal => 40.0;
}
