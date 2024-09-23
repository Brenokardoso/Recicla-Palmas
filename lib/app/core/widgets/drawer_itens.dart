import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';

class DrawerItens {
  DrawerItens._();

  static Widget logOutSystem(BuildContext context) {
    return Flexible(
      child: Row(
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
              child: const SizedBox(
                child: Text("Sair"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
