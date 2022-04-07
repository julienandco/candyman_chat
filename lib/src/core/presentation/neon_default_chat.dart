import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/src/chat_init.dart';

import 'package:neon_chat/src/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/conversations.dart';
import 'package:neon_chat/src/core/core.dart';

///
/// Instance of the NEON-Chat, that works out-of-the-box. Where I come from, we
/// call such things MDMAzing.
///
class NeonChat extends StatelessWidget {
  ///
  /// The FirebaseAuth Instance of your app.
  ///
  final FirebaseAuth firebaseAuthInstance;

  ///
  /// The FirebaseFirestore Instance of your app.
  ///
  final FirebaseFirestore firebaseFirestoreInstance;

  ///
  /// The RemoteDataSource you custom-implemented.
  ///
  final RemoteDataSource remoteDataSource;

  ///
  /// Do NOT fuck around with this, there is a reason this is optional.
  /// If you still feel a massive urge, be VERY aware of what you're doing.
  ///
  final FirebaseKeys firebaseKeys;

  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final PushNotificationToastStyle pushNotificationToastStyle;

  ///
  /// Gets called when a user wants to start a new 1-on-1 or group conversation.
  /// Possible implementation could be: a dialog shows up and lets the user
  /// selected all the wanted conversation partners and returns them as a
  /// [ConversationCreationData] instance.
  ///
  final ConversationCreationData Function()? getConversationCreationData;

  //TODO: function onChatSuccessfully created, default function: opens conversation

  ///
  /// Gets called when a user taps on the AppBar within a 1-on-1 conversation.
  /// Useful functionality would be to open the conversation partner's user
  /// profile.
  ///
  /// Default Functionality is nothing, as the app-internal user profile
  /// informations are not dealt with inside the NEON-Chat-Package.
  ///
  final Function(Conversation)? onDirectConversationAppBarTap;

  ///
  /// Gets called when a user taps on another user within the group conversation
  /// overview page.
  ///
  /// Default Functionality is nothing.
  ///
  final Function(String)? onOpenUserProfile;

  ///
  /// Gets called when a user taps on the AppBar within a group conversation.
  /// Default functionality is to open an overview screen that shows the
  /// group's thumbnail, name and all the group members.
  ///
  final Function(Conversation)? onGroupConversationAppBarTap;

  ///
  /// Set to true, if no [onGroupConversationAppBarTap] is provided and the default
  /// functionality should also not be triggered.
  ///
  final bool disableGroupChatAbbBarTap;

  const NeonChat({
    Key? key,
    required this.firebaseAuthInstance,
    required this.firebaseFirestoreInstance,
    required this.remoteDataSource,
    this.firebaseKeys = const FirebaseKeys(),
    this.conversationStyle = const ConversationStyle(),
    this.conversationsStyle = const ConversationsStyle(),
    this.searchAppBarStyle = const SearchAppBarStyle(),
    this.bottomBarStyle = const BottomBarStyle(),
    this.messageBubbleStyle = const MessageBubbleStyle(),
    this.pushNotificationToastStyle = const PushNotificationToastStyle(),
    this.onGroupConversationAppBarTap,
    this.disableGroupChatAbbBarTap = false,
    this.onDirectConversationAppBarTap,
    this.getConversationCreationData,
    this.onOpenUserProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeonChatLoader(
      firebaseAuth: firebaseAuthInstance,
      firebaseFirestore: firebaseFirestoreInstance,
      remoteDataSource: remoteDataSource,
      firebaseKeys: firebaseKeys,
      onAppBarTap: onGroupConversationAppBarTap ??
          (disableGroupChatAbbBarTap
              ? null
              : (conversation) => defaultOnGroupConversationAppBarTap(
                    context,
                    myId: firebaseAuthInstance.currentUser!.uid,
                    style: GroupChatOverviewStyle(
                      appBarColor: conversationsStyle.appBarColor,
                    ),
                    conversation: conversation,
                    onOpenUserProfile: onOpenUserProfile,
                  )),
      getConversationCreationData: getConversationCreationData,
      onDirectConversationAppBarTap: onDirectConversationAppBarTap,
      bottomBarStyle: bottomBarStyle,
      conversationsStyle: conversationsStyle,
      conversationStyle: conversationStyle,
      messageBubbleStyle: messageBubbleStyle,
      searchAppBarStyle: searchAppBarStyle,
      pushNotificationToastStyle: pushNotificationToastStyle,
      //TODO:
      isAuthenticated: () => true,
      remoteUploadsURL: 'foo',
    );
  }
}

//TODO: make sure NEON Chat Loader is excluded of the export statements of the library
class NeonChatLoader extends StatefulWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseKeys firebaseKeys;
  final RemoteDataSource remoteDataSource;

  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final PushNotificationToastStyle pushNotificationToastStyle;

  final Function(Conversation)? onAppBarTap;
  final ConversationCreationData Function()? getConversationCreationData;
  final Function(Conversation)? onDirectConversationAppBarTap;
  final bool Function() isAuthenticated;

  final String remoteUploadsURL;

  const NeonChatLoader({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseKeys,
    required this.remoteDataSource,
    required this.conversationStyle,
    required this.conversationsStyle,
    required this.messageBubbleStyle,
    required this.searchAppBarStyle,
    required this.bottomBarStyle,
    required this.pushNotificationToastStyle,
    required this.remoteUploadsURL,
    required this.isAuthenticated,
    this.onAppBarTap,
    this.getConversationCreationData,
    this.onDirectConversationAppBarTap,
  });

  @override
  State<NeonChatLoader> createState() => _NeonChatLoaderState();
}

class _NeonChatLoaderState extends State<NeonChatLoader> {
  @override
  void initState() {
    init(
        firebaseAuth: widget.firebaseAuth,
        firebaseFirestore: widget.firebaseFirestore,
        firebaseKeys: widget.firebaseKeys,
        remoteDataSource: widget.remoteDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => chatGetIt<GroupConversationTimestampsBloc>()
              ..add(GroupConversationTimestampsEvent.initialize(
                  widget.firebaseAuth.currentUser!.uid))),
        BlocProvider(
          create: (context) => chatGetIt<ConversationsSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => chatGetIt<CurrentConversationCubit>(),
        ),
        BlocProvider(
          create: (context) => chatGetIt<ConversationsBloc>(),
        ),
      ],
      child: DefaultConversationsLoader(
        conversationStyle: widget.conversationStyle,
        conversationsStyle: widget.conversationsStyle,
        messageBubbleStyle: widget.messageBubbleStyle,
        searchAppBarStyle: widget.searchAppBarStyle,
        bottomBarStyle: widget.bottomBarStyle,
        onAppbarTap: widget.onAppBarTap,
        onOpenUserProfile: widget.onDirectConversationAppBarTap,
        getConversationCreationData: widget.getConversationCreationData,
        //TODO: getUserAvatar
      ),
    );
  }
}
