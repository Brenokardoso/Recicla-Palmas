import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/custom_page_header.dart';
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
                    customPage(
                      pageWidth: sizeWidth,
                      pageHeight: constraits.maxHeight,
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
}
