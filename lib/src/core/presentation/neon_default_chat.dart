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
class NeonChat extends StatefulWidget {
  ///
  /// Needs to be called before the first appearance of the NEON Chat Widget
  /// inside of the widget tree.
  ///
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
    /// Returns whether the current user is authenticated or not. This information
    /// is used to determine whether the commands received via Data Messages
    /// should be handled (user is authenticated) or not (user not authenticated).
    /// Defaults to always be true.
    ///
    bool Function()? isAuthenticated,

    ///
    /// Pushes the Route to the Page where the [NeonChat] widget is built into
    /// the widget tree on the Navigator stack. ESSENTIAL for the functionality
    /// to open conversations by tapping on an incoming push notification.
    ///
    required void Function(BuildContext) openAppChatPage,

    ///
    /// The styling of the toasts that get triggered by every push notification.
    ///
    PushNotificationToastStyle pushNotificationToastStyle =
        const PushNotificationToastStyle(),
  }) {
    initNEONChat(
      firebaseAuth: firebaseAuth,
      firebaseFirestore: firebaseFirestore,
      firebaseKeys: firebaseKeys,
      remoteDataSource: remoteDataSource,
      isAuthenticated: isAuthenticated ?? () => true,
      pushNotificationToastStyle: pushNotificationToastStyle,
      openAppChatPage: openAppChatPage,
    );
  }

  ///
  /// Needs to be called if the calls to your backend that provides the user
  /// profile image data needs http headers.
  ///
  static Future<void> initNeonChatHttpHeaders(
      Map<String, String> httpHeaders) async {
    return await initHttpHeaders(httpHeaders);
  }

  ///
  /// Flag whether the conversationsBloc should be provided inside of the
  /// chat package. Be aware that if set to true, functionality such as the
  /// push notification service will only work inside the chat screen!
  /// Defaults to false.
  ///
  final bool provideConversationsBloc;

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
  final bool disableGroupConversationAppBarTap;

  ///
  /// Returns a Widget that is to be displayed as a user avatar, given a
  /// nullable user id String. Default is to show an empty [AvatarWidget].
  ///
  final Widget Function(String?)? getUserAvatar;

  ///
  /// Returns an instance of [FirebaseUser] given a userID.
  ///
  final FirebaseUser Function(String) getUserForID;

  ///
  /// Returns the display string to be shown next to the emoji of a given
  /// message type (for ex. an audio message preview would show up in the conversations
  /// screen as: 🎤 + return value of this method).
  ///
  final String Function(ConversationMessageType)?
      getConversationMessageTypeDisplayString;

  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;

  const NeonChat({
    Key? key,
    required this.getUserForID,
    this.onGroupConversationAppBarTap,
    this.disableGroupConversationAppBarTap = false,
    this.provideConversationsBloc = false,
    this.onDirectConversationAppBarTap,
    this.getConversationCreationData,
    this.onOpenUserProfile,
    this.getUserAvatar,
    this.conversationStyle = const ConversationStyle(),
    this.conversationsStyle = const ConversationsStyle(),
    this.messageBubbleStyle = const MessageBubbleStyle(),
    this.searchAppBarStyle = const SearchAppBarStyle(),
    this.bottomBarStyle = const BottomBarStyle(),
    this.getConversationMessageTypeDisplayString,
  }) : super(key: key);

  @override
  State<NeonChat> createState() => _NeonChatState();
}

class _NeonChatState extends State<NeonChat> {
  @override
  void initState() {
    super.initState();

    initStyles(
      conversationStyle: widget.conversationStyle,
      conversationsStyle: widget.conversationsStyle,
      messageBubbleStyle: widget.messageBubbleStyle,
      searchAppBarStyle: widget.searchAppBarStyle,
      bottomBarStyle: widget.bottomBarStyle,
    );

    initFunctions(
      FunctionInitData(
        getUserForID: widget.getUserForID,
        getConversationMessageTypeDisplayString:
            widget.getConversationMessageTypeDisplayString ??
                (type) => type.firebaseKey,
        getConversationCreationData: widget.getConversationCreationData,
        onGroupConversationAppBarTap: widget.onGroupConversationAppBarTap ??
            (widget.disableGroupConversationAppBarTap
                ? null
                : (conversation) => defaultOnGroupConversationAppBarTap(
                      context,
                      myId: chatGetIt<FirebaseAuth>().currentUser!.uid,
                      style: GroupChatOverviewStyle(
                        appBarColor:
                            chatGetIt<ConversationsStyle>().appBarColor,
                      ),
                      conversation: conversation,
                      onOpenUserProfile: widget.onOpenUserProfile,
                    )),
        onDirectConversationAppBarTap: widget.onDirectConversationAppBarTap,
        getUserAvatar: widget.getUserAvatar,
        onOpenUserProfile: widget.onOpenUserProfile,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => chatGetIt<ConversationsSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => chatGetIt<CurrentConversationCubit>(),
        ),
        if (widget.provideConversationsBloc)
          BlocProvider(
              create: (context) => chatGetIt<ConversationsBloc>()
                ..add(
                  ConversationsEvent.initialize(
                    myId: chatGetIt<FirebaseAuth>().currentUser!.uid,
                  ),
                )),
      ],
      child: const DefaultConversationsLoader(),
    );
  }
}
