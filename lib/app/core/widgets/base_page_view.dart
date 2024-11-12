import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/custom_table_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class BasePageView extends StatefulWidget {
  BasePageView({
    required this.appBarTitlle,
    required this.quemSomos,
    required this.oqueFazemos,
    this.hasRadioativo,
    this.hasColetaNaoReciclavel,
    this.hasMadeira,
    this.hasMaterialOrganico,
    this.hasMetal,
    this.hasPapel,
    this.hasPlastico,
    this.hasResiduosAmbulatorios,
    this.hasToxico,
    this.hasVidro,
    super.key,
  });

  String appBarTitlle;
  String quemSomos;
  String oqueFazemos;
  bool? hasRadioativo;
  bool? hasColetaNaoReciclavel;
  bool? hasMadeira;
  bool? hasMaterialOrganico;
  bool? hasMetal;
  bool? hasPapel;
  bool? hasPlastico;
  bool? hasResiduosAmbulatorios;
  bool? hasToxico;
  bool? hasVidro;

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    SizedBox space = const SizedBox(height: 16);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(widget.appBarTitlle),
      body: Container(
        height: pageHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            onError: (exception, stackTrace) =>
                Text("Houve um erro por $exception e $stackTrace"),
            opacity: 2,
            colorFilter: const ColorFilter.srgbToLinearGamma(),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            image: const AssetImage(
              "lib/app/core/assets/img/simbolos_reciclagem/planta.jpg",
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              quemSomos(
                widgetWidth: pageWidth,
                quemSomos: widget.quemSomos,
                oqueFazemos: widget.oqueFazemos,
              ),
              space,
              atividadesQueRealizamos(
                hasColetaNaoReciclavel: widget.hasColetaNaoReciclavel,
                hasMadeira: widget.hasMadeira,
                hasMaterialOrganico: widget.hasMaterialOrganico,
                hasMetal: widget.hasMetal,
                hasPapel: widget.hasPapel,
                hasPlastico: widget.hasPlastico,
                hasRadioativo: widget.hasRadioativo,
                hasResiduosAmbulatorios: widget.hasResiduosAmbulatorios,
                hasToxico: widget.hasToxico,
                hasVidro: widget.hasVidro,
              ),
              space,
              space,
              const Text(
                "Deseja agendar uma coleta?",
                style: TextStyle(color: Colors.white),
              ),
              CustomTableCalendar()
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
    // height: 100,
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
              child: Card(
                child: Text(
                  "Quem Somos: $quemSomos",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    // color: Colors.white,
                  ),
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
              child: Card(
                child: Text(
                  "O que fazemos: $oqueFazemos",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    // color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget atividadesQueRealizamos({
  bool? hasRadioativo,
  bool? hasColetaNaoReciclavel,
  bool? hasMadeira,
  bool? hasMaterialOrganico,
  bool? hasMetal,
  bool? hasPapel,
  bool? hasPlastico,
  bool? hasResiduosAmbulatorios,
  bool? hasToxico,
  bool? hasVidro,
}) {
  SizedBox spaceheight = const SizedBox(height: 16);

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
              "Coletas que realizamos:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      spaceheight,
      spaceheight,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: constructCardImage(
          hasRadioativo: hasRadioativo ?? false,
          hasColetaNaoReciclavel: hasColetaNaoReciclavel ?? false,
          hasMadeira: hasMadeira ?? false,
          hasMaterialOrganico: hasMaterialOrganico ?? false,
          hasMetal: hasMetal ?? false,
          hasPapel: hasPapel ?? false,
          hasPlastico: hasPlastico ?? false,
          hasResiduosAmbulatorios: hasResiduosAmbulatorios ?? false,
          hasToxico: hasToxico ?? false,
          hasVidro: hasVidro ?? false,
        ),
      )
    ],
  );
}

List<Widget> constructCardImage({
  bool hasRadioativo = false,
  bool hasColetaNaoReciclavel = false,
  bool hasMadeira = false,
  bool hasMaterialOrganico = false,
  bool hasMetal = false,
  bool hasPapel = false,
  bool hasPlastico = false,
  bool hasResiduosAmbulatorios = false,
  bool hasToxico = false,
  bool hasVidro = false,
}) {
  Map<String, bool> itemVisibility = {
    "radioativo": hasRadioativo,
    "coleta_nao_reciclavel": hasColetaNaoReciclavel,
    "madeira": hasMadeira,
    "material_organico": hasMaterialOrganico,
    "metal": hasMetal,
    "papel": hasPapel,
    "plastico": hasPlastico,
    "residuos_ambulatorios": hasResiduosAmbulatorios,
    "toxico": hasToxico,
    "vidro": hasVidro,
  };

  Map<String, String> mapCardItem = {
    "radioativo": "lib/app/core/assets/img/simbolos_reciclagem/radioativo.jpg",
    "coleta_nao_reciclavel":
        "lib/app/core/assets/img/simbolos_reciclagem/coleta_nao_reciclavel.jpg",
    "madeira": "lib/app/core/assets/img/simbolos_reciclagem/madeira.jpg",
    "material_organico":
        "lib/app/core/assets/img/simbolos_reciclagem/material_organico.jpg",
    "metal": "lib/app/core/assets/img/simbolos_reciclagem/metal.jpg",
    "papel": "lib/app/core/assets/img/simbolos_reciclagem/papel.jpg",
    "plastico": "lib/app/core/assets/img/simbolos_reciclagem/plastico.jpg",
    "residuos_ambulatorios":
        "lib/app/core/assets/img/simbolos_reciclagem/residuos_ambulatorios.jpg",
    "toxico": "lib/app/core/assets/img/simbolos_reciclagem/toxico.jpg",
    "vidro": "lib/app/core/assets/img/simbolos_reciclagem/vidro.jpg",
  };

  List<Widget> listWidgets = mapCardItem.entries.map((entry) {
    String item = entry.key;
    String imagePath = entry.value;

    return Visibility(
      visible: itemVisibility[item] ?? false,
      child: Flexible(
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }).toList();

  return listWidgets;
}
