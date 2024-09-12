import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  static Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user?.email == null) {
        return true;
      } else {
        return false;
      }
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
    return false;
  }

  static Future<void> signIn({
    required String email,
    required String passsword,
  }) async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signInWithPassword(
        email: email,
        password: passsword,
      );

      if (response.user?.email != null) {
        print("Usuário logado com sucesso");
      } else {
        print("Não foi possivel logar o usuáro");
      }
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
  }

  static Future<void> signOut() async {
    try {
      final dbInstance = SupabaseDb.supabase;
      final response = await dbInstance.auth.signOut();
      print("deslogado com sucesso");
    } on AuthException catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    } catch (errorType, erroCode) {
      print("Houve um error por motivos de $errorType em $erroCode");
    }
  }
}
