import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:woozy_search/woozy_search.dart';

class SearchConversationUC {
  SearchConversationUC();

  final _woozy = Woozy();

  void initialize(List<ConversationMessage> messages) {
    _woozy.setEntries([]);
    for (int index = 0; index < messages.length; index++) {
      if (messages[index].type == ConversationMessageType.text) {
        _woozy.addEntry(
          messages[index].text!,
          value: {
            "index": index,
            'timestamp': messages[index].timestamp ?? DateTime.now(),
          },
        );
      }
    }
  }

  List<int> search(String query) {
    final results = _woozy.search(query)
      ..sort(
        (b, a) => (a.value['timestamp'] as DateTime).compareTo(
          b.value['timestamp'] as DateTime,
        ),
      );
    final matchingIndices = <int>[];
    for (var i in results) {
      if (i.score > 0.66) {
        matchingIndices.add(i.value['index'] as int);
      }
    }
    return matchingIndices;
  }
}
