import 'package:flutter/material.dart';
import 'package:flutter_riverpodv2_supabase_app/countries/domain/country.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    super.key,
    required this.list,
  });

  final List<Country> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(list[index].name),
      ),
    );
  }
}
