import 'package:flutter/material.dart';

Widget customPage({
  required double pageWidth,
  required double pageHeight,
}) =>
    Container(
      width: pageWidth - 300,
      height: pageWidth,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          pageHeader(
            pageWidth: pageWidth,
            pageHeight: pageHeight,
          ),
          LayoutBuilder(
            builder: (context, constraits) {
              return Container(
                constraints: constraits,
                width: constraits.maxWidth,
                height: pageHeight - 126.01,
                color: Colors.grey[300],
              );
            },
          )
        ],
      ),
    );

Widget pageHeader({
  required double pageWidth,
  required double pageHeight,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            headerLeft(pageWidth),
            headerRight(pageWidth),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: Colors.grey,
          ),
        )
      ],
    );

Widget headerLeft(double pageWidth) => Container(
      width: (pageWidth - 300) / 2,
      height: 110,
      color: Colors.red,
      child: const ListTile(
        title: Text("Painel de Coletas"),
        subtitle: Text('Seja bem vindo(a) ao recicla Palmas'),
      ),
    );

Widget headerRight(double pageWidth) => Container(
      width: (pageWidth - 300) / 2,
      height: 110,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notification_add_rounded,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 250,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    width: 75,
                    height: 75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        image: AssetImage(
                          "lib/app/core/assets/img/image_user.png",
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  child: ListTile(
                    title: Text(
                      "User Name",
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: Text("Profissão"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
