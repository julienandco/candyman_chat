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
  /// Needs to be called before the first appearance of the NEON Chat Widget
  /// inside of the widget tree.
  ///
  static initNeonChat({
    ///
    /// The current locale of your app.
    ///
    required String locale,

    ///
    /// The FirebaseAuth Instance of your app.
    ///
    required FirebaseAuth firebaseAuth,

    ///
    /// The FirebaseFirestore Instance of your app.
    ///
    required FirebaseFirestore firebaseFirestore,

    ///
    /// Do NOT mess around with this, there is a reason this is optional.
    /// If you still feel a massive urge, be VERY aware of what you're doing.
    ///
    FirebaseKeys firebaseKeys = const FirebaseKeys(),

    ///
    /// The [NeonChatRemoteDataSource] you custom-implemented.
    ///
    required NeonChatRemoteDataSource remoteDataSource,

    ///
    /// All the information about the needed and optional functions
    /// you want to feed into the NEON Chat package.
    ///
    required FunctionInitData functionInit,

    ///
    /// All the routes you need to feed the NEON Chat package, so that
    /// the internal navigation works out of the box.
    ///
    required RoutingInitData routingInit,

    ///
    /// All the information about the custom widgets you want to feed into the
    /// NEON Chat package.
    ///
    WidgetInitData widgetInit = const WidgetInitData(),

    ///
    /// All the information about the additional data you want your
    /// [DirectConversation] and [GroupConversation] entities to hold.
    ///
    AdditionalDataInitData additionalDataInit = const AdditionalDataInitData(),

    ///
    /// All the styling information on how you want the NEON Chat to look like.
    ///
    StyleInitData styleInit = const StyleInitData(),
  }) {
    initNEONChatInternally(
      locale: locale,
      firebaseAuth: firebaseAuth,
      firebaseFirestore: firebaseFirestore,
      firebaseKeys: firebaseKeys,
      remoteDataSource: remoteDataSource,
      functionInit: functionInit,
      routingInit: routingInit,
      widgetInit: widgetInit,
      additionalDataInit: additionalDataInit,
      styleInit: styleInit,
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

  const NeonChat({
    Key? key,
    this.provideConversationsBloc = false,
  }) : super(key: key);

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
        if (provideConversationsBloc)
          BlocProvider(
            create: (context) => chatGetIt<ConversationsBloc>()
              ..add(
                ConversationsEvent.initialize(
                  myId: chatGetIt<FirebaseAuth>().currentUser!.uid,
                ),
              ),
          ),
      ],
      child: const DefaultConversationsLoader(),
    );
  }
}
