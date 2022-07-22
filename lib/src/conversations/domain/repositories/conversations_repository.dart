import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:neon_chat/neon_chat.dart';

abstract class ConversationsRepository {
  Stream<List<ConversationInfo>> getAllConversationInfos();
  Stream<ConversationInfo> getConversationInfo(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Stream<int> getUnreadGroupMessagesCount({
    required String conversationId,
    required Timestamp lastSeenTimestamp,
  });
  Future<Either<Failure, DirectConversation>> createDirectConversation({
    required FirebaseUser me,
    required DirectConversationCreationData creationData,
  });
  Future<Either<Failure, GroupConversation>> createGroupConversation({
    required FirebaseUser me,
    required GroupConversationCreationData creationData,
  });
  void hideConversations(String conversationId);
}
