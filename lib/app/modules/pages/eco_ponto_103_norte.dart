import 'package:flutter/material.dart';
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
      quemSomos:
          "Somos um ponto de coleta seletiva localizado no Anexo III da Corregedoria da Justiça, dedicado a receber e destinar corretamente resíduos recicláveis.",
      oqueFazemos:
          "Nosso objetivo é colaborar com a sustentabilidade e incentivar o descarte consciente, promovendo um futuro mais limpo e sustentável para a cidade.",
      hasMetal: true,
      hasPapel: true,
      hasPlastico: true,
    );
  }
}
