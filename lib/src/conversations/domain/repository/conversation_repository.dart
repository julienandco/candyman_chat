//TODO: import
import 'package:neon_chat/src/conversations/domain/entities/conversation/conversation.dart';

abstract class ConversationRepository {
  Stream<List<Conversation>> getAllConversations();
  Stream<Conversation> getConversation(String conversationId);

  Stream<int> getUnreadMessagesCount(String conversationId);
  Future<Conversation> createConversations(String chatPersonId);
  void hideConversations(String conversationId);
}

//TODO: old
// import 'package:papeo_app/features/chats/data/models/conversation_model.dart';

// abstract class ConversationRepository {

//   Stream<List<ConversationModel>> getAllConversations();
//   Stream<ConversationModel> getConversation(String conversationId);

//   Stream<int> getUnreadMessagesCount(String conversationId);
//   Future<ConversationModel> createConversations(String chatPersonId);
//   void hideConversations(String conversationId);
// }
