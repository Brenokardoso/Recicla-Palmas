
import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/themes/custom_themeData.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';

void main() {
  SupabaseDb.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recicla Palmas",
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      initialRoute: Routes.auth,
      routes: myRoutes,
    );
  }
}
