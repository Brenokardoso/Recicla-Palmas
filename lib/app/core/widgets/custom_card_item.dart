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
        child: SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
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
          height: 245,
          decoration: cardTopDecoration(pathImage),
        ),
        Container(
          width: 360,
          height: 250,
          decoration: cardBottomDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              titleTextDescription(descricao),
              space,
              textDescription(descricaoDosMateriais),
              space,
              Center(
                child: CustomButtons.buttonSecondary(
                  label: "Ir para o ponto de reciclagem",
                  icon: Icons.travel_explore_rounded,
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

BoxDecoration cardBottomDecoration() {
  return BoxDecoration(
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
  );
}

BoxDecoration cardTopDecoration(String pathImage) {
  return BoxDecoration(
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
  );
}
