import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

class CustomWarnings {
  CustomWarnings._();

  static Future<void> showSuccessDialog(
    BuildContext context,
    String label,
  ) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: CustomColors.inputBorderEnableColor,
        alignment: Alignment.center,
        elevation: 2,
        title: Text(label),
        titlePadding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide.none,
        ),
      ),
    );
  }

  static Future<void> showFailDialog(
    BuildContext context,
    String label,
  ) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: CustomColors.inputBorderEnableColor,
        alignment: Alignment.center,
        elevation: 2,
        title: Text(label),
        titlePadding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide.none,
        ),
      ),
    );
  }

  static ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showSuccessMaterialBanner({
    required BuildContext context,
    required String label,
  }) {
    return ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(label),
        actions: const [
          SizedBox.shrink(),
        ],
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSuccessSnackBar({
    required BuildContext context,
    required String label,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
        backgroundColor: CustomColors.inputBorderEnableColor,
        action: SnackBarAction(
          label: "X",
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showFailSnackBar({
    required BuildContext context,
    required String label,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
        backgroundColor: CustomColors.inputBorderErrorColor,
        action: SnackBarAction(
          label: "X",
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
