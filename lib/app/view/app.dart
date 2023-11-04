import 'package:flutter/material.dart';
import 'package:flutter_riverpodv2_supabase_app/counter/counter.dart';
import 'package:flutter_riverpodv2_supabase_app/countries/presentation/countries_page.dart';
import 'package:flutter_riverpodv2_supabase_app/l10n/l10n.dart';
import 'package:flutter_riverpodv2_supabase_app/messages/presentation/realtime_messages_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const RealtimeMessagesPage(),
      // home: const CountriesPage(),
    );
  }
}
