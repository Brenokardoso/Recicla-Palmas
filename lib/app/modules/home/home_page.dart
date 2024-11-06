import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/app_bar.dart';
import 'package:recicla_palmas/app/core/widgets/drawer.dart';
import 'package:recicla_palmas/app/core/widgets/drawer_itens.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      SupabaseDb.supabase.auth.onAuthStateChange.listen(
        (authState) {
          if (authState.session == null && mounted) {
            Navigator.of(context).pushReplacementNamed(Routes.authRoute);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar('Recicla Palmas'),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "lib/app/core/assets/img/nature_backgorund_application.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  customHeader(context,
                      "Descubra os locais de reciclagem perto de você"),
                  const OsmImplemetation(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customHeader(BuildContext context, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
