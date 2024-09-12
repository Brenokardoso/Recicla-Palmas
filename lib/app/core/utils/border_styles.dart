import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

class CustomBorderStyles {
  static OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: CustomColors.inputBorderFocusColor,
      width: 1,
    ),
  );

  static OutlineInputBorder erroBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: CustomColors.inputBorderErroColor,
      width: 1,
    ),
  );

  static OutlineInputBorder erroFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: CustomColors.inputBorderErroColor,
      width: 2,
    ),
  );

  static OutlineInputBorder enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: CustomColors.inputBorderEnableColor,
      width: 1,
    ),
  );

  static OutlineInputBorder disableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: CustomColors.halfBlack,
      width: 1,
    ),
  );

  static InputDecoration completeDecoration(
          {required String label, Widget? icon}) =>
      InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
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
          suffixIcon: icon ?? const SizedBox.shrink());
}
