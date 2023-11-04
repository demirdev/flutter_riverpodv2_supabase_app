import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `message.dart` with the code generated
// by freezed
part 'message.freezed.dart';
// optional: since our [Message] class is serialisable,
// we must add this line. but if [Message] was not serialisable,
// we could skip it.
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    /// Documentation for your parameter
    int? id,
    required String content,
    DateTime? createdAt,
  }) = _Message;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Message._();

  /// Converts a JSON [Map] into a [Message] instance
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
