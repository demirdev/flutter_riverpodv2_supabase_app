import 'package:flutter_riverpodv2_supabase_app/countries/presentation/provider/countries.dart';
import 'package:flutter_riverpodv2_supabase_app/messages/domain/message.dart';
import 'package:flutter_riverpodv2_supabase_app/services/Db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'realtime_messages.g.dart';

@riverpod
Stream<List<Message>> realtimeMessage(RealtimeMessageRef ref) async* {
  /// use supabase
  final stream = Db.instance.fromMessages().stream(primaryKey: ['id']);

  await for (final dataList in stream.map((i) => i)) {
    print(dataList);

    final messages = dataList.map((d) => Message.fromJson(d)).toList();
    yield messages;
  }

  ref.onDispose(() {
    // stream.;
    // subs.cancel();
  });
}
