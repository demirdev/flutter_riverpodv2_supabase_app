import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Db {
  Db._();

  static final instance = Db._();

  SupabaseQueryBuilder _from(String table) =>
      Supabase.instance.client.from(table);

  SupabaseQueryBuilder fromCountries() => _from('countries');
  SupabaseQueryBuilder fromMessages() => _from('messages');

  Future<void> initialize() async {
    const url = kDebugMode
        ? 'http://127.0.0.1:54321'
        : 'https://aomulibjnrnnklcbkjkt.supabase.co';
    final anonKey = kDebugMode
        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0'
        : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvbXVsaWJqbnJubmtsY2Jramt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkwNTc5NzYsImV4cCI6MjAxNDYzMzk3Nn0.o3-ZI4sgV1ICIEIT36YfzU4ynkVhjGueFwMQMEtbZaY';
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }
}
