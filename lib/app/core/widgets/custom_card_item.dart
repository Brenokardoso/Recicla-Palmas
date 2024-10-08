import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';

Widget customCardItem({
  required String pathImage,
  required String descricao,
  required String descricaoDosMateriais,
}) {
  SizedBox space = const SizedBox(height: 10);

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

  Widget customButton(VoidCallback? function, String label, IconData icon) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => function?.call(),
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero),
              ),
              label: Text(label),
              icon: Icon(icon),
            ),
          ),
        ],
      );

  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 250,
          height: 200,
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
          width: 250,
          height: 250,
          color: CustomColors.green500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              titleTextDescription(descricao),
              space,
              textDescription(descricaoDosMateriais),
              space,
              customButton(() {
                print("TESTE");
              }, "Teste", Icons.abc)
            ],
          ),
        )
      ],
    ),
  );
}
