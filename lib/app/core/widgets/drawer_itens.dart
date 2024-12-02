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
              height: 35,
              color: valueNotifier.value == compareValue
                  ? Colors.white
                  : Colors.transparent,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(icon),
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

Widget logoHeaderDrawer = Column(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(
      width: 340,
      height: 70,
      child: imageReciclaPalmas,
    ),
    const SizedBox(height: 10),
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
);
