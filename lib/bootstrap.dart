import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Supabase.initialize(
        url: 'https://aomulibjnrnnklcbkjkt.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvbXVsaWJqbnJubmtsY2Jramt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkwNTc5NzYsImV4cCI6MjAxNDYzMzk3Nn0.o3-ZI4sgV1ICIEIT36YfzU4ynkVhjGueFwMQMEtbZaY',
      );

      runApp(ProviderScope(child: await builder()));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
