import 'package:json_annotation/json_annotation.dart';
import 'package:neon_chat/neon_chat.dart';

class MyConversationMessageTypeConverter
    implements JsonConverter<ConversationMessageType, String> {
  const MyConversationMessageTypeConverter();

  @override
  ConversationMessageType fromJson(String json) {
    for (var type in ConversationMessageType.values) {
      if (json == type.firebaseKey) return type;
    }
    throw ArgumentError();
  }

  @override
  String toJson(ConversationMessageType object) {
    return object.firebaseKey;
  }
}
