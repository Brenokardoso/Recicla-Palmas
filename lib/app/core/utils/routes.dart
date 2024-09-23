import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/modules/auth/auth_page.dart';

class Routes {
  static String authRoute = "/auth";
}

Map<String, Widget Function(BuildContext)> myRoutes = {
  Routes.authRoute: (context) => const AuthPage()
};
