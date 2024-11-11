import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';

class BasePageView extends StatefulWidget {
  BasePageView({required this.appBarTitlle, super.key});

  String appBarTitlle;

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [quemSomos(widgetWidth: pageWidth)],
        ),
      ),
    );
  }
}

Widget quemSomos({required double widgetWidth}) {
  return Container(
    width: widgetWidth,
    height: 350,
    color: Colors.red,
    child: Card(
      color: CustomColors.cardColor,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  height: 75,
                  child: Text(
                    "Quem Somos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Text("Texto sobre quem somos"),
          )
        ],
      ),
    ),
  );
}
