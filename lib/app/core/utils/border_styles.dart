import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

class CustomBorderStyles {
  static OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: CustomColors.inputBorderFocusColor,
      width: 1,
    ),
  );

  static OutlineInputBorder erroBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: CustomColors.inputBorderErrorColor,
      width: 1,
    ),
  );

  static OutlineInputBorder erroFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: CustomColors.inputBorderErrorColor,
      width: 2,
    ),
  );

  static OutlineInputBorder enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
      width: 1.5,
    ),
  );

  static OutlineInputBorder disableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: CustomColors.halfBlack,
      width: 1,
    ),
  );

  static InputDecoration completeDecoration({
    required String label,
    String? placeholder,
    Widget? icon,
  }) =>
      InputDecoration(
        labelText: label,
        hintText: placeholder,
        labelStyle: TextStyle(fontSize: 24, color: Colors.grey[500]!),
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey[500]!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: CustomBorderStyles.focusBorder,
        errorBorder: CustomBorderStyles.erroBorder,
        focusedErrorBorder: CustomBorderStyles.erroFocusBorder,
        enabledBorder: CustomBorderStyles.enableBorder,
        disabledBorder: CustomBorderStyles.disableBorder,
        suffixIcon: icon ?? const SizedBox.shrink(),
      );
}
