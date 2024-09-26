import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';

class DrawerItens {
  DrawerItens._();

  static Widget logOutSystem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (context.mounted) {
                SupabaseAuth.signOut(context);
              }
            },
            child: Expanded(
              child: Container(
                color: Colors.red,
                height: 60,
                child: Text("Sair"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
