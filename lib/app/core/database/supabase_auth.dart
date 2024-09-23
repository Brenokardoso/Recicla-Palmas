import 'package:flutter/material.dart';
import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:recicla_palmas/app/core/utils/ui_warnings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    void Function()? function,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth
          .signUp(
        email: email,
        password: password,
      )
          .whenComplete(
        () {
          if (context.mounted) {
            CustomWarnings.showSuccessSnackBar(
              context: context,
              label: "Usuário cadastrado com sucesso",
            );
          }
        },
      );
      if (response.user?.email == null) {
        if (context.mounted) {
          CustomWarnings.showFailSnackBar(
            context: context,
            label: "Não foi possivel fazer o login",
          );
        }
      }
    } on AuthException catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    } catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    }
  }

  static Future<void> signIn({
    required BuildContext context,
    required String email,
    required String passsword,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth
          .signInWithPassword(
        email: email,
        password: passsword,
      )
          .whenComplete(
        () {
          if (context.mounted) {
            CustomWarnings.showSuccessSnackBar(
              context: context,
              label: "Usuário logado com sucesso",
            );
          }
        },
      );

      if (response.user?.email == null) {
        if (context.mounted) {
          CustomWarnings.showFailSnackBar(
            context: context,
            label: "Não foi possível faer o login",
          );
        }
      }
    } on AuthException catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    } catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    }
  }

  static Future<void> signOut(BuildContext context) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signOut().whenComplete(
        () {
          if (context.mounted) {
            CustomWarnings.showSuccessSnackBar(
              context: context,
              label: "Usuário cadastrado com sucesso",
            );
          }
        },
      );
    } on AuthException catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    } catch (errorType, erroCode) {
      if (context.mounted) {
        CustomWarnings.showFailSnackBar(
          context: context,
          label: "Houve um erro de $errorType por motivos de $erroCode",
        );
      }
    }
  }
}
