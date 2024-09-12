import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDb {
  static String url = "https://ffczmdzyvzcvwfqzlsrm.supabase.co";
  static String anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmY3ptZHp5dnpjdndmcXpsc3JtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjYxNDY1MzksImV4cCI6MjA0MTcyMjUzOX0.el4tMl8uHhKcnZsHEekA5TaaVYgRXP5M_2_ba90Vwlk";

  static Future<void> init() async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }

  static final supabase = Supabase.instance.client;
}
