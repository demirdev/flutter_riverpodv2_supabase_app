import 'package:flutter_riverpodv2_supabase_app/countries/domain/country.dart';
import 'package:flutter_riverpodv2_supabase_app/services/Db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countries.g.dart';

typedef Json = Map<String, dynamic>;

@riverpod
Future<List<Country>> countries(CountriesRef ref) async {
  final jsonList = await Db.instance.fromCountries().select<List<Json>>();
  final countries = jsonList.map(Country.fromJson).toList();

  return countries;
}
