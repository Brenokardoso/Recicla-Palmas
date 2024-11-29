import 'package:flutter/material.dart';

class CustomColors {
  static Color? cardColor = Colors.grey[350];
  static Color? green400 = Colors.green[400];
  static Color? green500 = Colors.green[500];
  static Color? green600 = Colors.green[500];
  static List<Color> gradientColorsAuth = [
    const Color(0xFF0DC5A5),
    const Color(0xFF17A84A),
    Colors.green[700]!,
    Colors.green[900]!
  ];
  static List<Color> gradientColorsDrawer = [
    const Color(0xFF01B596),
    const Color.fromARGB(255, 4, 211, 73),
    const Color.fromARGB(255, 4, 211, 73),
  ];

  static Color halfBlack = Colors.black45;
  static List<Color> colorGradientHeader = [
    Colors.green[500]!,
    Colors.green[400]!,
    Colors.green[300]!,
    Colors.green[200]!,
    Colors.green[100]!,
  ];
  static Color inputBorderFocusColor = Colors.green[300]!;
  static Color inputBorderEnableColor = Colors.green;
  static Color inputBorderErrorColor = Colors.red;
  static Color inputBorderColor = Colors.yellow;
}
