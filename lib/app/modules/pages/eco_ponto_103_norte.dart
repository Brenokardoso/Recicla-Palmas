import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/base_view_page.dart';

class EcoPonto103Norte extends StatefulWidget {
  const EcoPonto103Norte({super.key});

  @override
  State<EcoPonto103Norte> createState() => _EcoPonto103NorteState();
}

class _EcoPonto103NorteState extends State<EcoPonto103Norte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Ecoponto 103 Norte"),
      body: const BaseViewPage(),
    );
  }
}
