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
      color: Colors.white,
      child: ListTile(
        title: Text(
          "Painel de Coletas",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 30,
          ),
        ),
        subtitle: Text(
          'Seja bem vindo(a) ao recicla Palmas',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
          ),
        ),
      ),
    );

Widget headerRight(double pageWidth) => Container(
      width: (pageWidth - 300) / 2,
      height: 110,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              size: 24,
              Icons.notification_add_rounded,
              color: Colors.grey[600],
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
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
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
                Flexible(
                  child: ListTile(
                    title: Text(
                      "User Name",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    subtitle: Text(
                      "Profissão",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
