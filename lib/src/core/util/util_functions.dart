import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';

bool get isWebOrMacOS =>
    kIsWeb || defaultTargetPlatform == TargetPlatform.macOS;

const kMaxWidth = 800.0;
bool isWidthOverLimit(BuildContext context) =>
    MediaQuery.of(context).size.width > kMaxWidth;

String formatDatetime(DateTime? date) =>
    DateFormat('HH:mm', chatGetIt<String>(instanceName: kLocaleInstanceName))
        .format(date ?? DateTime.now());

String formatLastActiveDateTime(DateTime? date) {
  if (date == null) {
    return formatDatetime(null);
  }
  final now = DateTime.now();
  final differenceInDays = now.difference(date).inDays;
  if (differenceInDays < 1) {
    // show HH.mm
    return formatDatetime(date);
  } else {
    // show dMy, so 15. Okt. 2020 f.ex.

    return DateFormat(
            'd. MMM. y', chatGetIt<String>(instanceName: kLocaleInstanceName))
        .format(date);
  }
}

void openConversation(
  BuildContext context, {
  required String conversationId,
  bool showCloseButton = true,
  // CAUTION! Only set this to true, if you MADE ABSOLUTELY SURE that the
  // ChatPage is already in the widget tree! Otherwise, the chatGet it won't
  // be instantiated and all the necessary blocs will not be provided!
  bool chatPageAlreadyOnNavStack = false,
}) {
  if (!chatPageAlreadyOnNavStack) {
    //open up the chat page so that all the necessary blocs get provided and
    //the chat get it gets instantiated.
    context.router.push(chatGetIt.get<RoutingInitData>().chatPageRoute);
  }

  openConversationInternally(context, conversationId: conversationId);
}

void openConversationInternally(
  BuildContext context, {
  required String conversationId,
  bool showCloseButton = true,
}) {
  final conversationsBlocProvidedTopLevel = context
          .findAncestorWidgetOfExactType<BlocProvider<ConversationsBloc>>() !=
      null;

  print('FOUND ONE: $conversationsBlocProvidedTopLevel');
  if (conversationsBlocProvidedTopLevel) {
    print('FOUND: ${context.read<ConversationsBloc>()}');
  }

  context.router.push(
    chatGetIt<RoutingInitData>().buildConversationRoute(
      conversationId,
      showCloseButton,
      conversationsBlocProvidedTopLevel
          ? context.read<ConversationsBloc>()
          : null,
    ),
  );
}

void openConversationFromPushNotification(
  BuildContext context, {
  required String conversationId,
  bool showCloseButton = true,
}) {
  openConversation(context, conversationId: conversationId);
}

void defaultOnGroupConversationAppBarTap(
  BuildContext context, {
  required GroupChatOverviewStyle style,
  required GroupConversation conversation,
  required String myId,
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
