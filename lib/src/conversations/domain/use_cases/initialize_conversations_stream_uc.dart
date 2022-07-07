import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

class InitializeConversationsStreamUC {
  final ConversationsRepository conversationsRepository;

  const InitializeConversationsStreamUC(this.conversationsRepository);

  StreamSubscription<List<Conversation>>? call({
    required void Function(List<Conversation>)? onData,
    Function? onError,
  }) {
    final myId = chatGetIt<FirebaseAuth>().currentUser?.uid;
    if (myId != null) {
      return conversationsRepository
          .getAllConversationInfos()
          .transform<List<Conversation>>(StreamTransformer.fromHandlers(
              handleData: (data, sink) =>
                  _handleConvoInfos(infos: data, sink: sink, myId: myId)))
          .listen(
            onData,
            onError: onError,
          );
    }
    return null;
  }

  void _handleConvoInfos(
      {required List<ConversationInfo> infos,
      required EventSink<List<Conversation>> sink,
      required String myId}) async {
    List<Conversation> convos = [];
    for (var convoInfo in infos) {
      if (convoInfo.isGroupConversation) {
        List<FirebaseUser> conversationMembers = [];
        for (var userID in convoInfo.conversationMembers) {
          final tmpUser =
              await chatGetIt<FunctionInitData>().getUserForID(userID);
          conversationMembers.add(tmpUser);
        }
        convos.add(GroupConversation.fromConversationInfo(
          info: convoInfo,
          convoMembers: conversationMembers,
        ));
      } else {
        final otherUserID = convoInfo.conversationMembers
            .firstWhere((element) => element != myId);
        final tmpUser =
            await chatGetIt<FunctionInitData>().getUserForID(otherUserID);
        convos.add(DirectConversation.fromConversationInfo(
          info: convoInfo,
          otherUser: tmpUser,
        ));
      }
    }

    sink.add(convos);
  }
}
