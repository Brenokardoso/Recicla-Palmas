import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/utils/dialogs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signUp(
        email: email,
        password: password,
      );
      if (context.mounted) {
        CustomDialog.showSuccessMaterialBanner(
          context: context,
          // "Usuário logado com sucesso",
        );
      }
      print("Response value : $response");
      if (response.user?.email == null) {
        if (response.user?.email != null) {
        } else {
          if (context.mounted) {
            CustomDialog.showFailDialog(
              context,
              "Não foi possivel fazer o login",
            );
          }
        }
      }
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
  }

  static Future<void> signIn({
    required BuildContext context,
    required String email,
    required String passsword,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signInWithPassword(
        email: email,
        password: passsword,
      );
      print("Response value : $response");
      if (context.mounted) {
        CustomDialog.showSuccessDialog(
          context,
          "Usuário logado com sucesso",
        );
      }
      if (response.user?.email != null) {
        print("Caixa de dialogo : OK");
      } else {
        if (context.mounted) {
          CustomDialog.showFailDialog(
            context,
            "Não foi possivel fazer o login",
          );
        }
      }
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
  }

  static Future<void> signOut(BuildContext context) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signOut();
      if (context.mounted) {
        CustomDialog.showSuccessDialog(
          context,
          "Usuário deslogado com sucesso",
        );
      }
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
  }
}
