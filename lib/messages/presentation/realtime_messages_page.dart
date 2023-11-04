import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpodv2_supabase_app/messages/domain/message.dart';
import 'package:flutter_riverpodv2_supabase_app/messages/presentation/provider/realtime_messages.dart';
import 'package:flutter_riverpodv2_supabase_app/services/Db.dart';

class RealtimeMessagesPage extends ConsumerStatefulWidget {
  const RealtimeMessagesPage({super.key});

  @override
  ConsumerState<RealtimeMessagesPage> createState() =>
      _RealtimeMessagesPageState();
}

class _RealtimeMessagesPageState extends ConsumerState<RealtimeMessagesPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(realtimeMessageProvider);

    ref.listen(realtimeMessageProvider, (prev, next) {
      _scrollToEnd();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final date = DateTime.now();

              await Db.instance
                  .fromMessages()
                  .insert(Message(content: 'new: $date').toJson()
                    ..remove('id')
                    ..remove('createdAt'));
            },
          ),
        ],
      ),
      body: Center(
        child: switch (messages) {
          AsyncData(:final value) => ListView.builder(
              controller: scrollController,
              itemCount: value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value[index].content),
                );
              },
            ),
          AsyncError(:final error) => Text(error.toString()),
          _ => CircularProgressIndicator()
        },
      ),
    );
  }

  Future<void> _scrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 220));
    });
  }
}
