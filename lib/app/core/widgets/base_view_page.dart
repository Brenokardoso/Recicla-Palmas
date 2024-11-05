import 'package:flutter/material.dart';

class BaseViewPage extends StatelessWidget {
  const BaseViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, screamSize) {
        return Container(
          width: screamSize.maxWidth,
          height: screamSize.maxHeight,
          color: Colors.yellow,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                color: Colors.red,
              )),
              Expanded(
                  child: Container(
                color: Colors.blue,
              ))
            ],
          ),
        );
      },
    );
  }
}
