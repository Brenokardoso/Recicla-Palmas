import 'package:flutter/material.dart';

Widget customPageHeader({
  required double pageWidth,
  required double pageHeight,
}) =>
    Container(
      width: pageWidth - 300,
      height: pageWidth,
      color: Colors.blueGrey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: (pageWidth - 300) / 2,
                height: 110,
                color: Colors.red,
                child: const ListTile(
                  title: Text("Painel de Coletas"),
                  subtitle: Text('Seja bem vindo(a) ao recicla palmas'),
                ),
              ),
              Container(
                width: (pageWidth - 300) / 2,
                height: 110,
                color: Colors.orange,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
