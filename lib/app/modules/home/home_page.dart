import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/custom_card_item.dart';
import 'package:recicla_palmas/app/core/widgets/custom_page_itens.dart';
import 'package:recicla_palmas/app/core/widgets/drawer.dart';
import 'package:recicla_palmas/app/core/widgets/drawer_itens.dart';
import 'package:recicla_palmas/app/core/widgets/image.dart';
import 'package:recicla_palmas/app/core/widgets/map.dart';
import 'package:recicla_palmas/app/core/widgets/map_open.dart';

import '../../core/widgets/carrousel.dart';
import '../../core/widgets/grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // TODO: este trecho só deve ser descomentado se a auth pelo supabase estiver ativada!
    // WidgetsBinding.instance.addPostFrameCallback((timestamp) {
    //   SupabaseDb.supabase.auth.onAuthStateChange.listen(
    //     (authState) {
    //       if (authState.session == null && mounted) {
    //         Navigator.of(context).pushReplacementNamed(Routes.authRoute);
    //       }
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    double pi = 3.14159;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    SizedBox spaceDrawerItem = const SizedBox(height: 25);
    ValueNotifier<int> indexPage = ValueNotifier<int>(0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          customDrawer(
            context: context,
            drawerItens: listDrawerItens(indexPage: indexPage),
          ),
          ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (_, value, __) => LayoutBuilder(
              builder: (context, constraits) {
                return IndexedStack(
                  index: value,
                  children: [
                    page1(
                        sizeWidth: sizeWidth,
                        constMaxheight: constraits.maxHeight + 200,
                        valueNotifier: indexPage),
                    page2(
                      sizeWidth: sizeWidth,
                      constMaxheight: constraits.maxHeight,
                      valueNotifier: indexPage,
                    ),
                    page3(
                      sizeWidth: sizeWidth,
                      constMaxheight: constraits.maxHeight,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget page1({
    required double sizeWidth,
    required double constMaxheight,
    required ValueNotifier valueNotifier,
  }) =>
      customPage(
        pageWidth: sizeWidth,
        pageHeight: constMaxheight + 200,
        itens: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (_, value, __) {
                  return Container(
                    height: constMaxheight + 100,
                    width: (sizeWidth - 300) / 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListTile(
                              title: Text(
                                "Mapa de coleta",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: CustomColors.green500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "Clique no ponto e navegue na rota mais próxima de você",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: valueNotifier.value == 0 ? true : false,
                            child: OsmImplemetation(
                              heightScream: constMaxheight - 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                height: constMaxheight + 200,
                width: (sizeWidth - 300) / 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text(
                            "Pontos de coleta",
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomColors.green500,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "Conheça mais sobre os contos de coleta que você pode estar descartando",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      customCarousel(
                        listCustomCardsItens(context: context),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      );

  Widget page2({
    required double sizeWidth,
    required double constMaxheight,
    required ValueNotifier valueNotifier,
  }) {
    return customPage(
      pageWidth: sizeWidth,
      pageHeight: constMaxheight + 100,
      itens: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListTile(
            title: Text(
              "Mapa de coleta",
              style: TextStyle(
                  fontSize: 18,
                  color: CustomColors.green500,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "Clique no ponto e navegue na rota mais próxima de você",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
              ),
            ),
          ),
        ),
        Visibility(
          visible: valueNotifier.value == 1 ? true : false,
          child: Container(
            height: constMaxheight,
            width: sizeWidth,
            child: OsmImplemetationOpenMap(
              heightScream: constMaxheight,
            ),
          ),
        )
      ],
    );
  }

  Widget page3({
    required double sizeWidth,
    required double constMaxheight,
  }) =>
      customPage(
        pageWidth: sizeWidth,
        pageHeight: constMaxheight,
        itens: [
          Container(
            height: constMaxheight,
            width: sizeWidth,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: Text(
                        "Mapa de coleta",
                        style: TextStyle(
                            fontSize: 18,
                            color: CustomColors.green500,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Clique no ponto e navegue na rota mais próxima de você",
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
          // customGridCards(listCustomCardsItens(context: context)),
        ],
      );
}
