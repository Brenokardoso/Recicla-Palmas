import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/drawer.dart';
import 'package:recicla_palmas/app/core/widgets/drawer_itens.dart';
import 'package:recicla_palmas/app/core/widgets/image.dart';
import 'package:recicla_palmas/app/core/widgets/map.dart';

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
    SizedBox space = const SizedBox(height: 10);
    ValueNotifier<int> indexPage = ValueNotifier<int>(0);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          customDrawer(
            context: context,
            drawerItens: [
              logoHeaderDrawer,
              customDrawerItem(
                  icon: Icons.abc,
                  title: "Todo Painel",
                  func: () {
                    print('Retorno da função');
                  }),
              space,
              customDrawerItem(
                  title: "Mapa de coleta",
                  icon: Icons.question_answer,
                  func: () {
                    print('Retorno da função 2 ');
                  }),
              space,
              customDrawerItem(
                  title: "Pontos de coleta",
                  icon: Icons.question_answer,
                  func: () {
                    print('Retorno da função 3 ');
                  }),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (_, value, __) => LayoutBuilder(
              builder: (context, constraits) {
                return IndexedStack(
                  index: value,
                  children: [
                    Container(
                      width: sizeWidth - 300,
                      height: constraits.maxHeight,
                      color: Colors.blueGrey[50],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                    ),
                    Container(
                      width: sizeWidth - 300,
                      height: constraits.maxHeight,
                      color: Colors.yellow,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                    ),
                    Container(
                      width: sizeWidth - 300,
                      height: constraits.maxHeight,
                      color: Colors.pink,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget logoHeaderDrawer = Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 300,
        height: 70,
        child: imageReciclaPalmas,
      ),
      const SizedBox(height: 10),
      const Text(
        "Recicla Palmas",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
