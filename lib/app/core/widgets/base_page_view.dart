import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';

class BasePageView extends StatefulWidget {
  BasePageView({
    required this.appBarTitlle,
    required this.whoWeAre,
    required this.oqueFazemos,
    super.key,
  });

  String appBarTitlle;
  String whoWeAre;
  String oqueFazemos;

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(widget.appBarTitlle),
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              quemSomos(
                widgetWidth: pageWidth,
                quemSomos: widget.whoWeAre,
                oqueFazemos: widget.oqueFazemos,
              ),
              atividadesQueRealizamos()
            ],
          ),
        ),
      ),
    );
  }
}

Widget quemSomos({
  required double widgetWidth,
  String? quemSomos = '',
  String? oqueFazemos = "",
}) {
  SizedBox spaceheight = const SizedBox(height: 15);
  return SizedBox(
    width: widgetWidth,
    height: 100,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                "Quem Somos: $quemSomos",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        spaceheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                "O que fazemos: $oqueFazemos",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget atividadesQueRealizamos() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              "Atvidades que realizamos",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: constructCardImage(),
      )
    ],
  );
}

List<Widget> constructCardImage() {
  List<String> listCardItem = [
    "lib/app/core/assets/img/simbolos_reciclagem/radioativo.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/coleta_nao_reciclavel.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/madeira.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/material_organico.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/metal.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/papel.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/plastico.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/residuos_ambulatorios.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/toxico.jpg",
    "lib/app/core/assets/img/simbolos_reciclagem/vidro.jpg",
  ];

  List<Widget> listWidgets = List.generate(
    listCardItem.length,
    (index) {
      return Flexible(
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                listCardItem[index],
              ),
            ),
          ),
        ),
      );
    },
  );

  return listWidgets;
}
