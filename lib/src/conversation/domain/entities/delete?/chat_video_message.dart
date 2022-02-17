import 'dart:typed_data';

import '../chat_message.dart';

class ChatVideoMessage extends ChatMessage<Uint8List> {
  const ChatVideoMessage({
    required Uint8List content,
    required DateTime sent,
  }) : super(
          content: content,
          sent: sent,
        );
}
