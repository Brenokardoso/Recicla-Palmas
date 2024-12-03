import 'package:flutter/material.dart';

Widget customGridCards(List<Widget> widgets) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // 3 widgets por linha
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: widgets.length,
    itemBuilder: (context, index) {
      return widgets[index];
    },
    padding: EdgeInsets.all(8.0),
  );
}
