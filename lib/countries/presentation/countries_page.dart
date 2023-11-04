import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpodv2_supabase_app/countries/domain/country.dart';
import 'package:flutter_riverpodv2_supabase_app/countries/presentation/country_list.dart';
import 'package:flutter_riverpodv2_supabase_app/countries/presentation/provider/countries.dart';
import 'package:flutter_riverpodv2_supabase_app/services/Db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CountriesPage extends ConsumerWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countries = ref.watch(countriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries (${countries.value?.length ?? '...'})'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              if (countries.value == null) return;
              await Db.instance
                  .fromCountries()
                  .delete()
                  .match(countries.value!.first.toJson());
              ref.refresh(countriesProvider);
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final randomInt = Random().nextInt(100000);

              await Db.instance.fromCountries().insert(
                  Country(name: 'new ${randomInt}').toJson()..remove('id'));
              ref.refresh(countriesProvider);
            },
          )
        ],
      ),
      body: switch (countries) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData(:final value) => CountryList(list: value),
        _ => const CircularProgressIndicator.adaptive(),
      },
    );
  }
}
