import 'dart:typed_data';

import 'chat_message.dart';

class ChatImageMessage extends ChatMessage<Uint8List> {
  const ChatImageMessage({
    required Uint8List content,
    required DateTime sent,
  }) : super(
          content: content,
          sent: sent,
        );
}
