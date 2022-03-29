import 'dart:async';

import 'package:neon_chat/neon_chat.dart';

class InitializeConversationStreamUC {
  final ConversationRepository conversationRepository;

  const InitializeConversationStreamUC({
    required this.conversationRepository,
  });

  StreamSubscription<dynamic> call({
    required String conversationId,
    required dynamic Function(List<ChatMessage>) combiner,
    required void Function(dynamic)? onData,
  }) {
    return conversationRepository
        .getMessages(conversationId)
        .listen((chatMessageList) => onData?.call(combiner(chatMessageList)));
  }
}
