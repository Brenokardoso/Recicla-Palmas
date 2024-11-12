import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/base_page_view.dart';

class EcoPonto103Norte extends StatefulWidget {
  const EcoPonto103Norte({super.key});

  @override
  State<EcoPonto103Norte> createState() => _EcoPonto103NorteState();
}

class _EcoPonto103NorteState extends State<EcoPonto103Norte> {
  @override
  Widget build(BuildContext context) {
    return BasePageView(
      appBarTitlle: "Eco Ponto 103 Norte",
      whoWeAre:
          "Somos um ponto de coleta especializado nas coletas de materiais reciclaveis",
      oqueFazemos: "Coletamos os seguintes materiais:",
      hasMetal: true,
      hasPapel: true,
      hasPlastico: true,
    );
  }
}
