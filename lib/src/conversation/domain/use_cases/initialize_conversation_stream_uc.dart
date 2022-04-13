import 'dart:async';

import 'package:neon_chat/neon_chat.dart';
import 'package:rxdart/rxdart.dart';

class InitializeConversationStreamUC {
  final ConversationRepository conversationRepository;
  final ConversationsRepository conversationsRepository;

  const InitializeConversationStreamUC({
    required this.conversationRepository,
    required this.conversationsRepository,
  });

  StreamSubscription<dynamic> call({
    required String conversationId,
    required dynamic Function(
      List<ConversationMessage>,
      Conversation,
      String,
    )
        combiner,
    required void Function(dynamic)? onData,
  }) {
    return CombineLatestStream.combine3(
      conversationRepository.getMessages(conversationId),
      conversationsRepository.getConversation(conversationId),
      conversationRepository.getDisplayName(conversationId),
      combiner,
    ).listen((event) => onData?.call(event));
    // return conversationRepository.getMessages(conversationId).listen(
    //     (conversationMessageList) =>
    //         onData?.call(combiner(conversationMessageList)));
  }
}
