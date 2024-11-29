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
    FontWeight? fontWeight,
    double? elevation,
  }) =>
      ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.normal,
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
        elevation: WidgetStateProperty.all<double>(elevation ?? 1),
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
    double? elevation,
    FontWeight? fontWeight,
  }) =>
      ElevatedButton(
        onPressed: function,
        style: _customButtomStyle(
          label: label,
          fontSize: fontSize,
          width: width,
          height: height,
          colorBackground: colorBackground,
          elevation: elevation,
          fontWeight: fontWeight,
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
    Color? colorBackgroundButton,
    double? elevation,
    FontWeight? fontWeight,
  }) =>
      ElevatedButton.icon(
        onPressed: function,
        style: _customButtomStyle(
          label: label,
          fontSize: fontSize,
          width: width,
          height: height,
          colorBackground: colorBackgroundButton ?? Colors.green[900],
          elevation: elevation,
          fontWeight: fontWeight,
        ),
        iconAlignment: IconAlignment.end,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: colorFont ?? Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
