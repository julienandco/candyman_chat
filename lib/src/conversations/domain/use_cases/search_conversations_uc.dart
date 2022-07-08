import 'package:neon_chat/src/conversations/conversations.dart';

/// A Use Case that searches through all the active conversations the current
/// user has and looks for matches with the query string and the name of the
/// conversation.
class SearchConversationsUC {
  final String _myId;
  SearchConversationsUC(String? id) : _myId = id ?? '';

  List<ConversationItem> _conversationItems = [];

  void initialize(List<ConversationItem> conversationItems) {
    _conversationItems = conversationItems;
  }

  List<ConversationItem> search(String query) {
    if (_myId.isEmpty) {
      return conversations;
    }
    final results = <ConversationItem>{};
    for (int i = 0; i < _conversationItems.length; i++) {
      String data = _conversationItems[i].conversation.displayName;
      if (data.toLowerCase().contains(query.toLowerCase())) {
        results.add(conversations[i]);
      }
    }
    return results.toList();
  }

  List<ConversationItem> get conversations => _conversationItems;
}
