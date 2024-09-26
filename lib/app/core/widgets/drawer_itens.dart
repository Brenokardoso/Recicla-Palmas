import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';

class DrawerItens {
  DrawerItens._();

  static Widget defaultBodyDrawerItem({
    required BuildContext context,
    required String label,
    dynamic function,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Container(
              color: Colors.red,
              height: 100,
              child: Text(label),
            ),
          )
        ],
      );

  static Widget logOutSystem(BuildContext context) => defaultBodyDrawerItem(
        context: context,
        label: "Sair",
        // function: SupabaseAuth.signOut(context),
      );
}
