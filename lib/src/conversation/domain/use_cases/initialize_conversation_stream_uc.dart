import 'dart:async';

import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:rxdart/rxdart.dart';

class InitializeConversationStreamUC {
  final ConversationRepository conversationRepository;
  final ConversationsRepository conversationsRepository;

  const InitializeConversationStreamUC({
    required this.conversationRepository,
    required this.conversationsRepository,
  });

  StreamSubscription<dynamic> call(
      {required String conversationId,
      required dynamic Function(
        List<ConversationMessage>,
        Conversation,
      )
          combiner,
      required void Function(dynamic)? onData,
      required String myId}) {
    return CombineLatestStream.combine2(
      conversationRepository.getMessages(conversationId),
      _handleConvoInfoStream(
        conversationId: conversationId,
        myId: myId,
      ),
      combiner,
    ).listen((event) => onData?.call(event));
  }

  Stream<Conversation> _handleConvoInfoStream(
          {required String conversationId, required String myId}) =>
      conversationsRepository
          .getConversationInfo(conversationId)
          .transform<Conversation>(StreamTransformer.fromHandlers(
              handleData: (data, sink) => _handleConvoInfo(
                    info: data,
                    sink: sink,
                    myId: myId,
                  )));

  void _handleConvoInfo(
      {required ConversationInfo info,
      required EventSink<Conversation> sink,
      required String myId}) async {
    late Conversation convo;
    if (info.isGroupConversation) {
      List<FirebaseUser> conversationMembers = [];
      for (var userID in info.conversationMembers) {
        final tmpUser =
            await chatGetIt<FunctionInitData>().getUserForID(userID);
        conversationMembers.add(tmpUser);
      }
      convo = GroupConversation.fromConversationInfo(
        info: info,
        convoMembers: conversationMembers,
      );
    } else {
      final otherUserID =
          info.conversationMembers.firstWhere((element) => element != myId);
      final tmpUser =
          await chatGetIt<FunctionInitData>().getUserForID(otherUserID);
      convo = DirectConversation.fromConversationInfo(
        info: info,
        otherUser: tmpUser,
      );
    }
    sink.add(convo);
  }
}
