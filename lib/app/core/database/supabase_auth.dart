import 'package:recicla_palmas/app/core/database/supabase_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  static Future<bool> signUp(
      {required String email, required String password}) async {
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
}
