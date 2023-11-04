import 'package:supabase_flutter/supabase_flutter.dart';

class Db {
  Db._();

  static final instance = Db._();

  SupabaseQueryBuilder _from(String table) =>
      Supabase.instance.client.from(table);

  SupabaseQueryBuilder fromCountries() => _from('countries');
}
