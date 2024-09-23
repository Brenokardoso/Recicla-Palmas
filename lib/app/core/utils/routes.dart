import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/modules/auth/auth_page.dart';

class Routes {
  static String auth = "/auth";
}

Map<String, Widget Function(BuildContext)> myRoutes = {
  Routes.auth: (context) => const AuthPage()
};
