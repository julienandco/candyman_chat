import 'chat_message.dart';

class ChatTextMessage extends ChatMessage<String> {
  const ChatTextMessage({
    required String content,
    required DateTime sent,
  }) : super(
          content: content,
          sent: sent,
        );
}
