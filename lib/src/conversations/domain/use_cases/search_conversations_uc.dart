import 'package:neon_chat/src/conversations/conversations.dart';

/// A Use Case that searches through all the active conversations the current
/// user has and looks for matches with the query string and the name of the
/// conversation.
class SearchConversationsUC {
  SearchConversationsUC();

  List<ConversationItem> _conversations = [];

  void initialize(List<ConversationItem> conversations) {
    _conversations = conversations;
  }

  List<ConversationItem> search(String query) {
    final results = <ConversationItem>{};
    for (int i = 0; i < _conversations.length; i++) {
      String data = _conversations[i].conversationPartner.name;
      if (data.toLowerCase().contains(query.toLowerCase())) {
        results.add(conversations[i]);
      }
    }
    return results.toList();
  }

  List<ConversationItem> get conversations => _conversations;
}
