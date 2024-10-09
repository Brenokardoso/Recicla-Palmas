import 'package:flutter/material.dart';

class CustomButtons {
  CustomButtons._();

  static ElevatedButton buttonPrimary({
    required String label,
    required double fontSize,
    required double width,
    required double height,
    void Function()? function,
    Color? colorFont,
    Color? colorBackground,
  }) =>
      ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(width, height),
          ),
          alignment: Alignment.center,
          elevation: WidgetStateProperty.all<double>(1),
          padding:
              WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
          backgroundColor: WidgetStateProperty.all<Color?>(
            colorBackground,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: colorFont ?? Colors.black,
          ),
        ),
      );

  static ElevatedButton buttonSecondary({
    required String label,
    required IconData icon,
    required double fontSize,
    required double width,
    required double height,
    void Function()? function,
    Color? colorFont,
    Color? colorBackground,
  }) =>
      ElevatedButton.icon(
        iconAlignment: IconAlignment.end,
        icon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(
            color: colorFont ?? Colors.black,
          ),
        ),
        onPressed: function,
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(width, height),
          ),
          alignment: Alignment.center,
          elevation: WidgetStateProperty.all<double>(1),
          padding:
              WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
          backgroundColor: WidgetStateProperty.all<Color?>(
            colorBackground,
          ),
        ),
      );
}
