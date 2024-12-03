import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

Widget customDrawer({
  required BuildContext context,
  required List<Widget> drawerItens,
}) {
  double sizeHeight = MediaQuery.of(context).size.height;

  return Container(
    width: 300,
    height: sizeHeight,
    decoration: BoxDecoration(
      image: DecorationImage(
        onError: (exception, stackTrace) => const SizedBox(
          height: 100,
          width: 100,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        filterQuality: FilterQuality.high,
        fit: BoxFit.fitWidth,
        image: const AssetImage("lib/app/core/assets/img/background_verde.png"),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: drawerItens,
    ),
  );
}
