import 'package:flutter_riverpodv2_supabase_app/app/app.dart';
import 'package:flutter_riverpodv2_supabase_app/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
