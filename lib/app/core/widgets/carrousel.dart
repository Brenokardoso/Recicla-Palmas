import 'package:flutter/material.dart';
import 'dart:async';

Widget customCarousel(List<Widget> widgets) {
  PageController controller = PageController();
  Timer.periodic(Duration(seconds: 4), (timer) {
    if (controller.hasClients) {
      int nextPage = (controller.page?.toInt() ?? 0) + 1;
      if (nextPage >= (widgets.length / 4).ceil()) {
        nextPage = 0;
      }
      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  });

  return Flexible(
    child: PageView.builder(
      controller: controller,
      itemCount: (widgets.length / 4).ceil(),
      itemBuilder: (context, index) {
        int start = index * 4;
        int end = (start + 4) > widgets.length ? widgets.length : start + 4;
        List<Widget> pageWidgets = widgets.sublist(start, end);

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pageWidgets.take(2).toList(),
            ),
            if (pageWidgets.length > 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pageWidgets.skip(2).toList(),
              ),
          ],
        );
      },
    ),
  );
}
