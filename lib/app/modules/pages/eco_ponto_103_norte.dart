import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/base_page_view.dart';
import 'package:recicla_palmas/app/core/widgets/custom_page_itens.dart';

class EcoPonto103Norte extends StatefulWidget {
  const EcoPonto103Norte({super.key});

  @override
  State<EcoPonto103Norte> createState() => _EcoPonto103NorteState();
}

class _EcoPonto103NorteState extends State<EcoPonto103Norte> {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: customPage(
        pageWidth: sizeWidth - 300,
        pageHeight: sizeHeight,
      ),
    );
  }
}
