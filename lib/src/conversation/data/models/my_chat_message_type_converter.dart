import 'package:json_annotation/json_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

class MyChatMessageTypeConverter
    implements JsonConverter<ChatMessageType, String> {
  const MyChatMessageTypeConverter();

  @override
  ChatMessageType fromJson(String json) {
    for (var type in ChatMessageType.values) {
      if (json == type.firebaseKey) return type;
    }
    throw ArgumentError();
  }

  @override
  String toJson(ChatMessageType object) {
    return object.firebaseKey;
  }
}
