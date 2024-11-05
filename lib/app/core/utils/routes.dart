import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/modules/auth/auth_page.dart';
import 'package:recicla_palmas/app/modules/home/home_page.dart';
import 'package:recicla_palmas/app/modules/pages/eco_ponto_103_norte.dart';

class Routes {
  static String authRoute = "/auth";
  static String homeRoute = "/home";
  static String point103 = "pages/ecoponto 103 norte";
}

Map<String, Widget Function(BuildContext)> myRoutes = {
  // Routes.authRoute: (context) => const AuthPage(),
  Routes.homeRoute: (context) => const HomePage(),
  Routes.point103: (context) => const EcoPonto103Norte()
};
