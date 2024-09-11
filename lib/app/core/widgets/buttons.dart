import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

class CustomButtons {
  CustomButtons._();

  static ElevatedButton buttonPrimary({
    required String label,
    required double fontSize,
    required double width,
    required double height,
    void Function()? function,
    Color? color,
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
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color ?? Colors.black,
          ),
        ),
      );
}
