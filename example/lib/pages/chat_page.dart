import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonChat(
        getUserForID: (id) async => Future.delayed(
          const Duration(milliseconds: 250),
          () => FirebaseUser(
              id: id,
              username: 'user ${id.substring(0, 4)}',
              profilePictureURL:
                  'https://cdn.getyourguide.com/img/tour/6242c553ab0ca.jpeg/146.jpg'),
        ),
        additionalDirectConversationDataConfig: _MyCustomAdditionalData(),
        onDirectConversationAppBarTap: (conversation) =>
            log(conversation.additionalData!['startDate'].toString()),
        provideConversationsBloc: true,
        getUserAvatar: (_) => const Icon(Icons.person),
        getGroupAvatar: (_) => const Icon(Icons.group),
        getConversationCreationData: () => DirectConversationCreationData(
          conversationPartner: FirebaseUser(
              id: 'ZeA12jhPSvXoO0ODxdkpXktn6QW2', username: 'Julien3'),
        ),
        conversationsStyle: const ConversationsStyle(
          showAppBarAboveConversations: true,
          noConversationsWidget: Text('oh man alter'),
          showFab: true,
          fabColor: Colors.red,
        ),
      ),
    );
  }
}

class _MyCustomAdditionalData implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos => [
        AdditionalConversationDataInfo<DateTime?, Timestamp?>(
            firebaseKey: 'startDate',
            fromJson: (json) {
              if (json == null) return null;
              return json.toDate();
            },
            toJson: (date) {
              if (date == null) return null;
              return Timestamp.fromDate(date);
            })
      ];
}
