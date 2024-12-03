import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/custom_page_itens.dart';
import 'package:recicla_palmas/app/core/widgets/custom_table_calendar.dart';
import 'package:recicla_palmas/app/core/widgets/drawer.dart';
import 'package:recicla_palmas/app/core/widgets/drawer_itens.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          customDrawer(
            context: context,
            drawerItens: listDrawerItensAGendamento(context: context),
          ),
          customPage(
            pageWidth: sizeWidth - 300,
            pageHeight: sizeHeight,
            itens: [
              Container(
                height: sizeHeight + 100,
                width: 800,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text(
                            "Nome / Endereço do ponto de coleta",
                            style: TextStyle(
                              fontSize: 18,
                              color: CustomColors.green500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            """Clique no ponto e navegue na rota mais próxima de você""",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
