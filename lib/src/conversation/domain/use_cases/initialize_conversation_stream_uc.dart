import 'dart:async';

import 'package:neon_chat/neon_chat.dart';
import 'package:rxdart/rxdart.dart';

class InitializeConversationStreamUC {
  final ConversationRepository conversationRepository;
  final ConversationsRepository conversationsRepository;
  final FirebaseUserProfileRepository firebaseUserProfileRepository;

  const InitializeConversationStreamUC({
    required this.conversationRepository,
    required this.conversationsRepository,
    required this.firebaseUserProfileRepository,
  });

  StreamSubscription<dynamic> call({
    required String conversationId,
    required String otherUserProfileId,
    required void Function(Conversation, List<ChatMessage>, FirebaseUser)
        combiner,
    required void Function(dynamic)? onData,
  }) {
    return CombineLatestStream.combine3(
      conversationsRepository.getConversation(conversationId),
      conversationRepository.getMessages(conversationId),
      firebaseUserProfileRepository.getUserProfile(otherUserProfileId),
      combiner,
    ).listen(
      onData,
    );
  }
}
