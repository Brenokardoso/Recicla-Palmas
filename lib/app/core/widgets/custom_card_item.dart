import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/buttons.dart';

Widget customCardItem({
  required String pathImage,
  required String descricao,
  required String descricaoDosMateriais,
  void Function()? func,
}) {
  SizedBox space = const SizedBox(height: 15);

  TextStyle titleTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  TextStyle descriptionTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w200,
    overflow: TextOverflow.ellipsis,
  );

  Widget titleTextDescription(String title) => Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: titleTextStyle,
            textAlign: TextAlign.center,
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
            border: const Border(
              left: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
              right: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
              top: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
            ),
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
          decoration: BoxDecoration(
            color: CustomColors.green400,
            border: const Border(
              left: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
              right: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
              bottom: BorderSide(
                width: 2.0,
                color: Colors.greenAccent,
              ),
            ),
          ),
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
                  label: "Ir para o ponto de reciclagem",
                  icon: Icons.abc,
                  fontSize: 12,
                  width: 225,
                  height: 60,
                  function: () => func!.call(),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
