import 'dart:async';

import 'package:neon_chat/neon_chat.dart';

class InitializeConversationsStreamUC {
  final ConversationsRepository conversationsRepository;

  const InitializeConversationsStreamUC(this.conversationsRepository);

  StreamSubscription<List<Conversation>>? call({
    required void Function(dynamic)? onData,
    Function? onError,
  }) {
    return conversationsRepository.getAllConversations().listen(
          onData,
          onError: onError,
        );
  }
}
