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

  TextStyle titleTextStyle = TextStyle(
    color: Colors.grey[600]!,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  TextStyle descriptionTextStyle = TextStyle(
    color: Colors.grey[600]!,
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

  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 360,
            height: 300,
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
                    label: "Ponto de reciclagem",
                    icon: Icons.recycling,
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
    ),
  );
}

BoxDecoration cardBottomDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
    color: Colors.white,
    border: Border(
      left: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
      ),
      right: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
      ),
      bottom: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
      ),
    ),
  );
}

BoxDecoration cardTopDecoration(String pathImage) {
  return BoxDecoration(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(
        30,
      ),
    ),
    border: Border(
      left: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
      ),
      right: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
      ),
      top: BorderSide(
        width: 2.0,
        color: Colors.grey[300]!,
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
