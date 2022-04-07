import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';
import 'package:neon_chat/src/core/core.dart';
import 'package:neon_chat/src/conversations/conversations.dart';

class DefaultConversationLoader extends StatelessWidget {
  final FileUploadRepository fileUploadRepository;
  final ConversationBloc Function(String) conversationBloc;
  final ConversationSearchBloc Function() conversationSearchBloc;

  final ConversationItem conversationItem;
  final bool showCloseButton;

  final DateTime groupConversationLastSeenTimestamp;

  final ConversationStyle conversationStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final Function(String, DateTime) updateGroupConversationTimestamp;
  final Function(Conversation)? onAppbarTap;

  final PushNotificationService pushNotificationService;

  const DefaultConversationLoader({
    Key? key,
    required this.conversationItem,
    required this.fileUploadRepository,
    required this.conversationBloc,
    required this.conversationSearchBloc,
    required this.conversationStyle,
    required this.messageBubbleStyle,
    required this.searchAppBarStyle,
    required this.bottomBarStyle,
    required this.updateGroupConversationTimestamp,
    required this.groupConversationLastSeenTimestamp,
    required this.pushNotificationService,
    this.showCloseButton = true,
    this.onAppbarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConversationBloc>(
          create: (context) =>
              conversationBloc(conversationItem.conversation.id)
                ..add(ConversationEvent.init(
                  conversationItem: conversationItem,
                )),
        ),
        BlocProvider<ConversationSearchBloc>(
          create: (context) => conversationSearchBloc(),
        ),
      ],
      child: DefaultConversationPage(
        pushNotificationService: pushNotificationService,
        getUploadUrlUC: GetUploadUrlUC(fileUploadRepository),
        updateTimestampForConversation: (timestamp) =>
            updateGroupConversationTimestamp(
                conversationItem.conversation.id, timestamp),
        groupConversationLastSeenTimestamp: groupConversationLastSeenTimestamp,
        defaultMessageBubbleStyle: messageBubbleStyle,
        defaultConversationStyle: conversationStyle,
        defaultSearchAppBarStyle: searchAppBarStyle,
        defaultBottomBarStyle: bottomBarStyle,
        showCloseButton: showCloseButton,
        onAppbarTap: onAppbarTap,
      ),
    );
  }
}
