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
  static initNeonChat({
    ///
    /// The FirebaseAuth Instance of your app.
    ///
    required FirebaseAuth firebaseAuth,

    ///
    /// The FirebaseFirestore Instance of your app.
    ///
    required FirebaseFirestore firebaseFirestore,

    ///
    /// The [NeonChatRemoteDataSource] you custom-implemented.
    ///
    required NeonChatRemoteDataSource remoteDataSource,

    ///
    /// Do NOT fuck around with this, there is a reason this is optional.
    /// If you still feel a massive urge, be VERY aware of what you're doing.
    ///
    FirebaseKeys firebaseKeys = const FirebaseKeys(),

    ///
    /// Method to determine whether the current user is authenticated. Used
    /// to handle received data messages from firebase (user is authenticated)
    /// or ignore them (user is not authenticated).
    /// defaults to always be true.
    ///
    bool Function()? isAuthenticated,
    ConversationStyle conversationStyle = const ConversationStyle(),
    ConversationsStyle conversationsStyle = const ConversationsStyle(),
    MessageBubbleStyle messageBubbleStyle = const MessageBubbleStyle(),
    SearchAppBarStyle searchAppBarStyle = const SearchAppBarStyle(),
    BottomBarStyle bottomBarStyle = const BottomBarStyle(),
    PushNotificationToastStyle pushNotificationToastStyle =
        const PushNotificationToastStyle(),
    String? remoteUploadsURL,
  }) {
    initNEONChat(
      firebaseAuth: firebaseAuth,
      firebaseFirestore: firebaseFirestore,
      firebaseKeys: firebaseKeys,
      remoteDataSource: remoteDataSource,
      remoteUploadsURL: remoteUploadsURL,
      isAuthenticated: isAuthenticated ?? () => true,
      bottomBarStyle: bottomBarStyle,
      conversationsStyle: conversationsStyle,
      conversationStyle: conversationStyle,
      messageBubbleStyle: messageBubbleStyle,
      searchAppBarStyle: searchAppBarStyle,
      pushNotificationToastStyle: pushNotificationToastStyle,
    );
  }

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

  ///
  /// Returns whether the current user is authenticated or not. This information
  /// is used to determine whether the commands received via Data Messages
  /// should be handled (user is authenticated) or not (user not authenticated).
  /// Defaults to always be true.
  ///
  final bool Function()? isAuthenticated;

  ///
  /// The URL where all the uploads (especially the photos) are stored. Defaults
  /// to be null, so no user photos will be displayed.
  ///
  final String? remoteUploadsURL;

  ///
  /// Returns a Widget that is to be displayed as a user avatar, given a
  /// nullable user id String. Default is to show an empty [AvatarWidget].
  ///
  final Widget Function(String?)? getUserAvatar;

  const NeonChat({
    Key? key,
    this.onGroupConversationAppBarTap,
    this.disableGroupChatAbbBarTap = false,
    this.onDirectConversationAppBarTap,
    this.getConversationCreationData,
    this.onOpenUserProfile,
    this.isAuthenticated,
    this.remoteUploadsURL,
    this.getUserAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => chatGetIt<GroupConversationTimestampsBloc>()
              ..add(GroupConversationTimestampsEvent.initialize(
                  chatGetIt<FirebaseAuth>().currentUser!.uid))),
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
        onAppbarTap: onGroupConversationAppBarTap ??
            (disableGroupChatAbbBarTap
                ? null
                : (conversation) => defaultOnGroupConversationAppBarTap(
                      context,
                      myId: chatGetIt<FirebaseAuth>().currentUser!.uid,
                      style: GroupChatOverviewStyle(
                        appBarColor:
                            chatGetIt<ConversationsStyle>().appBarColor,
                      ),
                      conversation: conversation,
                      onOpenUserProfile: onOpenUserProfile,
                    )),
        onOpenUserProfile: onDirectConversationAppBarTap,
        getConversationCreationData: getConversationCreationData,
        getUserAvatar: getUserAvatar,
      ),
    );
  }
}
