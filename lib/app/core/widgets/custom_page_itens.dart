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
            Container(
              width: (pageWidth - 300) / 2,
              height: 110,
              color: Colors.red,
              child: const ListTile(
                title: Text("Painel de Coletas"),
                subtitle: Text('Seja bem vindo(a) ao recicla Palmas'),
              ),
            ),
            Container(
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "lib/app/core/assets/img/image_user.png"))),
                        ),
                        const ListTile(
                          title: Text(
                            "User Name",
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text("Profissão"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
    );
