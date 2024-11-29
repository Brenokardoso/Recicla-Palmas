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
    ValueNotifier<int> indexPage = ValueNotifier<int>(0);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          customDrawer(context: context, drawerItens: [
            SizedBox(
              width: 300,
              height: 70,
              child: imageReciclaPalmas,
            ),
            ElevatedButton.icon(
              onPressed: () {
                indexPage.value = 0;
              },
              label: Text("page 0"),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            ElevatedButton.icon(
              onPressed: () {
                indexPage.value = 1;
              },
              label: Text("dpage 1 "),
              icon: Icon(Icons.lunch_dining_outlined),
            ),
            ElevatedButton.icon(
              onPressed: () {
                indexPage.value = 2;
              },
              label: Text("page 2"),
              icon: Icon(Icons.sunny),
            )
          ]),
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
                      child: Column(
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
                      child: Column(
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
                      child: Column(
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
}
