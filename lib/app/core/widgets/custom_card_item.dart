import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/buttons.dart';

Widget customCardItem({
  required String pathImage,
  required String descricao,
  required String descricaoDosMateriais,
}) {
  SizedBox space = const SizedBox(height: 15);

  TextStyle titleTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  TextStyle descriptionTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w200,
    overflow: TextOverflow.ellipsis,
  );

  Widget titleTextDescription(String title) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
      );

  Widget textDescription(String title) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: descriptionTextStyle,
          ),
        ),
      );

  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 360,
          height: 205,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                pathImage,
              ),
            ),
          ),
        ),
        Container(
          width: 360,
          height: 250,
          color: CustomColors.green400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              titleTextDescription(descricao),
              space,
              textDescription(descricaoDosMateriais),
              space,
              space,
              Center(
                child: CustomButtons.buttonSecondary(
                  label: "ButtonTest",
                  icon: Icons.abc,
                  fontSize: 12,
                  width: 275,
                  height: 50,
                  function: () {},
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
