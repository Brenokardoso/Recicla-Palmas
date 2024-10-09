import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

class CustomButtons {
  CustomButtons._();

  static ButtonStyle _customButtomStyle({
    required String label,
    required double fontSize,
    required double width,
    required double height,
    required Color? colorBackground,
  }) =>
      ButtonStyle(
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
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        backgroundColor: WidgetStateProperty.all<Color?>(
          colorBackground,
        ),
      );

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
        style: _customButtomStyle(
          label: label,
          fontSize: fontSize,
          width: width,
          height: height,
          colorBackground: colorBackground,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: colorFont ?? Colors.black,
          ),
        ),
      );

  static Widget buttonSecondary({
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
        icon: Icon(
          icon,
          color: CustomColors.green400,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: colorFont ?? Colors.black,
          ),
        ),
        onPressed: function,
        style: _customButtomStyle(
          label: label,
          fontSize: fontSize,
          width: width,
          height: height,
          colorBackground: colorBackground,
        ),
      );
}
