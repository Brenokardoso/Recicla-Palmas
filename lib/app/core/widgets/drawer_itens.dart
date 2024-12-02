import 'package:flutter/material.dart';

Widget customDrawerItem({
  required String title,
  required IconData icon,
  void Function()? func,
}) {
  return ListTile(
    leading: Container(
      width: 5,
      height: 50,
      color: Colors.white,
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
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
    onTap: () {
      func?.call();
    },
  );
}
