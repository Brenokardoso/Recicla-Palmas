import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_auth.dart';

class DrawerItens {
  DrawerItens._();

  static TextStyle customTextSyle = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static Widget _defaultBodyDrawerItem({
    required BuildContext context,
    required String label,
    dynamic function,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                function();
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 70,
                child: Text(
                  label,
                  style: customTextSyle,
                ),
              ),
            ),
          )
        ],
      );

  static DrawerHeader drawerHeader() => DrawerHeader(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      child: Image.network(
                          "data:image/jpeg;base64,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"),
                    ),
                    Text("Avatar Name")
                  ],
                ),
              ),
            )
          ],
        ),
      );

  static Widget logOutSystem(BuildContext context) => _defaultBodyDrawerItem(
        context: context,
        label: "Sair",
        function: SupabaseAuth.signOut(context),
      );
}
