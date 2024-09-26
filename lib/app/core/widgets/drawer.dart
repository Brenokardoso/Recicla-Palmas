import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

Drawer customDrawer(List<Widget> itens) {
  return Drawer(
    backgroundColor: CustomColors.cardColor,
    elevation: 2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(color: Colors.green, width: 1),
    ),
    shadowColor: Colors.black38,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: itens,
    ),
  );
}
