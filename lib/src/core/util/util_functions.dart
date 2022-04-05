import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:neon_chat/neon_chat.dart';

bool get isWebOrMacOS =>
    kIsWeb || defaultTargetPlatform == TargetPlatform.macOS;

const kMaxWidth = 800.0;
bool isWidthOverLimit(BuildContext context) =>
    MediaQuery.of(context).size.width > kMaxWidth;

// TODO: get correct locale, not hardcoded de, maybe insert into chatDatastructure?
String formatDatetime(DateTime? date) =>
    DateFormat('HH:mm').format(date ?? DateTime.now());

void openConversation(
  BuildContext context, {
  required ConversationItem conversationItem,
  required FileUploadRepository fileUploadRepository,
  required ConversationBloc Function() generateConversationBloc,
  required ConversationSearchBloc Function() generateConversationSearchBloc,
  required Function(String, DateTime) updateGroupConversationTimestamp,
  DateTime? groupChatLastSeenTimestamp,
  SearchAppBarStyle searchAppBarStyle = const SearchAppBarStyle(),
  MessageBubbleStyle chatBubbleStyle = const MessageBubbleStyle(),
  ConversationStyle conversationStyle = const ConversationStyle(),
  BottomBarStyle bottomBarStyle = const BottomBarStyle(),
  Function(Conversation)? onAppbarTap,
  bool showCloseButton = true,
}) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => DefaultConversationLoader(
        groupConversationLastSeenTimestamp: groupChatLastSeenTimestamp,
        updateGroupConversationTimestamp: updateGroupConversationTimestamp,
        fileUploadRepository: fileUploadRepository,
        conversationBloc: generateConversationBloc,
        conversationSearchBloc: generateConversationSearchBloc,
        searchAppBarStyle: searchAppBarStyle,
        chatBubbleStyle: chatBubbleStyle,
        conversationStyle: conversationStyle,
        bottomBarStyle: bottomBarStyle,
        conversationItem: conversationItem,
        onAppbarTap: onAppbarTap,
        showCloseButton: showCloseButton,
      ),
    ),
  );
}

void defaultOnGroupChatAppBarTap(
  BuildContext context, {
  required GroupChatOverviewStyle style,
  required Conversation conversation,
  Function(String)? onOpenUserProfile,
}) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: style.centerAppbarTitle,
            title: Text(conversation.displayName),
            backgroundColor: style.appBarColor,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: AvatarWidget(
                  imgUrl: conversation.thumbnail,
                  size: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    style.memberListTitle,
                    style: style.memberListTitleStyle,
                  ),
                ),
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: conversation.conversationMembers.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: GroupConversationMemberListItem(
                    user: conversation.conversationMembers[i],
                    style: style,
                    onOpenUserProfile: onOpenUserProfile,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
