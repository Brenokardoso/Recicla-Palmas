import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/widgets/image.dart';

Widget customDrawerItem({
  required String title,
  required IconData icon,
  void Function()? func,
  required ValueNotifier valueNotifier,
  int? compareValue,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (_, value, __) {
          return ListTile(
            leading: Container(
              width: 5,
              height: 30,
              color: valueNotifier.value == compareValue
                  ? Colors.white
                  : Colors.transparent,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onTap: () {
              func?.call();
            },
          );
        }),
  );
}

Widget logoHeaderDrawer = Padding(
  padding: const EdgeInsets.only(top: 20.0),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 340,
        height: 70,
        child: imageReciclaPalmas,
      ),
      const Text(
        "Recicla Palmas",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 20),
    ],
  ),
);

List<Widget> listDrawerItens({required ValueNotifier indexPage}) => [
      logoHeaderDrawer,
      customDrawerItem(
          icon: Icons.dashboard,
          title: "Todo Painel",
          valueNotifier: indexPage,
          compareValue: 0,
          func: () {
            indexPage.value = 0;
          }),
      const SizedBox(height: 20),
      customDrawerItem(
          title: "Mapa de coleta",
          icon: Icons.location_on,
          valueNotifier: indexPage,
          compareValue: 1,
          func: () {
            indexPage.value = 1;
          }),
      const SizedBox(height: 20),
      customDrawerItem(
          title: "Pontos de coleta",
          icon: Icons.view_carousel,
          valueNotifier: indexPage,
          compareValue: 2,
          func: () {
            indexPage.value = 2;
          }),
    ];
