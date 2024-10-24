import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/modules/auth/auth_page.dart';
import 'package:recicla_palmas/app/modules/home/home_page.dart';

class Routes {
  static String authRoute = "/";
  static String homeRoute = "/home";
}

Map<String, Widget Function(BuildContext)> myRoutes = {
  Routes.authRoute: (context) => const AuthPage(),
  Routes.homeRoute: (context) => const HomePage(),
};
