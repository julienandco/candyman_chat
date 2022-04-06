import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/neon_chat.dart';

abstract class ConversationsRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Stream<int> getUnreadGroupMessagesCount({
    required String conversationId,
    required Timestamp lastSeenTimestamp,
  });
  Future<Conversation> createConversation({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  });
  Future<Conversation> createGroupConversation({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  });
  void hideConversations(String conversationId);
}
