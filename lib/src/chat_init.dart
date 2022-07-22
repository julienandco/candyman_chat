import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

GetIt chatGetIt = GetIt.instance;
const kHttpHeadersInstanceName = 'httpHeaders';
const kLocaleInstanceName = 'locale';

initNEONChatInternally({
  required FirebaseAuth firebaseAuth,
  required FirebaseFirestore firebaseFirestore,
  required FirebaseKeys firebaseKeys,
  required NeonChatRemoteDataSource remoteDataSource,
  required FunctionInitData functionInit,
  required RoutingInitData routingInit,
  required WidgetInitData widgetInit,
  required AdditionalDataInitData additionalDataInit,
  required StyleInitData styleInit,
}) {
  try {
    //Locale
    chatGetIt.registerLazySingleton<String>(() => 'en_US',
        instanceName: kLocaleInstanceName);

    //Firebase
    _registerFirebase(
      firebaseAuth: firebaseAuth,
      firebaseFirestore: firebaseFirestore,
      firebaseKeys: firebaseKeys,
    );

    //Singletons (Repos, UCs, Services)
    _registerSingletons(
      firebaseAuth: firebaseAuth,
      firebaseFirestore: firebaseFirestore,
      firebaseKeys: firebaseKeys,
      remoteDataSource: remoteDataSource,
      isAuthenticated: functionInit.isAuthenticated,
      pushNotificationToastStyle: styleInit.pushNotificationToastStyle,
    );

    //Factories (Blocs, Cubits)
    _registerFactories();

    //Style
    _registerStyles(styleInit);

    //Functions
    _registerFunctions(functionInit);

    //Widgets
    _registerWidgets(widgetInit);

    //AdditionalData for Conversation Datastructure
    _registerAdditionalData(additionalDataInit);

    //Routing
    _registerRouting(routingInit);

    log('NEONChat successfully initialized!');
  } catch (e) {
    log('initNEONChat called multiple times. Only initialize the NEON Chat once!',
        error: e);
  }
}

initHttpHeaders(Map<String, String> httpHeaders) async {
  try {
    //unregister the default value
    await chatGetIt.unregister<Map<String, String>>(
        instanceName: kHttpHeadersInstanceName);

    chatGetIt.registerLazySingleton<Map<String, String>>(() => httpHeaders,
        instanceName: kHttpHeadersInstanceName);
  } catch (e) {
    log('initHttpHeaders called multiple times. Only initialize the headers once!',
        error: e);
  }
}

Future<void> initLocale(String locale) async {
  try {
    //unregister the default value
    await chatGetIt.unregister<String>(instanceName: kLocaleInstanceName);
    chatGetIt.registerLazySingleton<String>(() => locale,
        instanceName: kLocaleInstanceName);
  } catch (e) {
    log('initLocale called multiple times. Only initialize the locale once!',
        error: e);
  }
}

///
/// Contains all the information about the needed and optional functions
/// you can feed into the NEON Chat package.
///
class FunctionInitData {
  //TODO: function onChatSuccessfully created, default function: opens conversation

  ///
  /// Returns whether the current user is authenticated or not. This information
  /// is used to determine whether the commands received via Data Messages
  /// should be handled (user is authenticated) or not (user not authenticated).
  /// Defaults to always be true.
  ///
  final bool Function()? _isAuthenticated;

  ///
  /// Returns a Future instance of [FirebaseUser] given a userID. An easy way
  /// to implement this is to wrap your implementation of a user into the
  /// [FirebaseUser] datastructure that is defined in this package.
  ///
  final Future<FirebaseUser> Function(String) getUserForID;

  ///
  /// Returns the display string to be shown next to the emoji of a given
  /// message type (for ex. an audio message preview would show up in the conversations
  /// screen as: 🎤 + return value of this method).
  ///
  final String Function(ConversationMessageType)?
      _getConversationMessageTypeDisplayString;

  ///
  /// Gets called when a user taps on the AppBar within a 1-on-1 conversation.
  /// Useful functionality would be to open the conversation partner's user
  /// profile.
  ///
  /// Default Functionality is nothing, as the app-internal user profile
  /// informations are not dealt with inside the NEON-Chat-Package.
  ///
  final Function(DirectConversation)? onDirectConversationAppBarTap;

  ///
  /// Gets called when a user taps on the AppBar within a group conversation.
  /// Default functionality is to open an overview screen that shows the
  /// group's thumbnail, name and all the group members.
  ///
  final Function(GroupConversation)? _onGroupConversationAppBarTap;

  ///
  /// If set to true and no custom implementation of a ConversationAppBar has
  /// been fed to the NEON Chat via [ConversationStyle], this flags blocks
  /// any functionality from happening upon a tap on the app bar inside a
  /// group conversation.
  ///
  final bool disableGroupConversationAppBarTap;

  ///
  /// Only used if [ConversationsStyle.showFab] == true and
  /// [ConversationsStyle.fabAction] == null. Thus, this is called when a user
  /// wants to start a new 1-on-1 or group conversation via the default
  /// FloatingActionButton (FAB) on the [DefaultConversationsPage].
  /// Possible implementation could be: a dialog shows up and lets the user
  /// selected all the wanted conversation partners and returns them as a
  /// [ConversationCreationData] instance.
  ///
  final ConversationCreationData Function()? getConversationCreationData;

  ///
  /// Gets called when a user taps on another user within the group conversation
  /// overview page.
  ///
  /// Default Functionality is nothing.
  ///
  final Function(String)? onOpenUserProfile;

  FunctionInitData({
    required this.getUserForID,

    ///
    /// Returns whether the current user is authenticated or not. This information
    /// is used to determine whether the commands received via Data Messages
    /// should be handled (user is authenticated) or not (user not authenticated).
    /// Defaults to always be true.
    ///
    bool Function()? isAuthenticated,

    ///
    /// Returns the display string to be shown next to the emoji of a given
    /// message type (for ex. an audio message preview would show up in the conversations
    /// screen as: 🎤 + return value of this method).
    ///
    final String Function(ConversationMessageType)?
        getConversationMessageTypeDisplayString,
    this.onDirectConversationAppBarTap,

    ///
    /// Gets called when a user taps on the AppBar within a group conversation.
    /// Default functionality is to open an overview screen that shows the
    /// group's thumbnail, name and all the group members.
    ///
    Function(GroupConversation)? onGroupConversationAppBarTap,
    this.getConversationCreationData,
    this.onOpenUserProfile,
    this.disableGroupConversationAppBarTap = false,
  })  : _onGroupConversationAppBarTap = onGroupConversationAppBarTap,
        _isAuthenticated = isAuthenticated,
        _getConversationMessageTypeDisplayString =
            getConversationMessageTypeDisplayString;

  void onGroupConversationAppBarTap(GroupConversation conversation) {
    if (!disableGroupConversationAppBarTap) {
      _onGroupConversationAppBarTap?.call(conversation);
    }
  }

  bool isAuthenticated() => (_isAuthenticated?.call()) ?? true;

  String getConversationMessageTypeDisplayString(
          ConversationMessageType type) =>
      _getConversationMessageTypeDisplayString?.call(type) ?? type.firebaseKey;
}

///
/// Contains all the information about the custom widgets you can feed into the
/// NEON Chat package.
///
class WidgetInitData {
  ///
  /// Returns a Widget that is to be displayed as a user avatar, given a
  /// nullable user id String. Default is to show an empty [AvatarWidget].
  ///
  final Widget Function(String?)? getUserAvatar;

  ///
  /// Returns a Widget that is to be displayed as a group avatar, given a
  /// nullable groupPicture String. Default is to show an empty [AvatarWidget].
  ///
  final Widget Function(String?)? getGroupAvatar;

  ///
  /// Returns a Widget that is used to separate message bubbles of different
  /// days in the [DefaultConversationPage]. It is given the timestamp of
  /// the next message block in form of a [DateTime]. So if message X was sent
  /// yesterday and message Y was sent today, the UI would look like this:
  ///
  /// Bubble of Message X
  ///
  /// The Widget returned by this function
  ///
  /// Bubble of Message Y
  ///
  final Widget Function(DateTime)? conversationDateSeparatorBuilder;

  const WidgetInitData({
    this.getUserAvatar,
    this.getGroupAvatar,
    this.conversationDateSeparatorBuilder,
  });
}

///
/// Contains all the routes you need to feed the NEON Chat package, so that
/// the internal navigation works out of the box.
///
class RoutingInitData {
  ///
  /// The Route to the Page where the [NeonChat] widget is built into
  /// the widget tree on the Navigator stack.
  ///
  final PageRouteInfo<dynamic> chatPageRoute;

  ///
  /// The Route to a [DefaultConversationPage] instance, given a specific
  /// conversation ID.
  ///
  final PageRouteInfo<dynamic> Function(
    String,
    bool,
    ConversationsBloc?,
  ) buildConversationRoute;

  ///
  /// The Route to a [ChatMediaViewerLoader] instance, given a specific message
  /// that contains some kind of media (photo, video, file).
  ///
  final PageRouteInfo<dynamic> Function(
    String,
    ConversationMessage,
    ConversationBloc,
  ) buildChatMediaViewerRoute;

  RoutingInitData({
    required this.chatPageRoute,
    required this.buildConversationRoute,
    required this.buildChatMediaViewerRoute,
  });
}

///
/// Contains all the information about the additional data you want your
/// [DirectConversation] and [GroupConversation] entities to hold.
///
class AdditionalDataInitData {
  ///
  /// Your implementation of [AdditionalConversationDataConfig] in case you
  /// want your [DirectConversation] objects to store further information
  /// that are not defined within the Chat Package.
  ///
  final AdditionalConversationDataConfig? additionalDirectConversationData;

  ///
  /// Your implementation of [AdditionalConversationDataConfig] in case you
  /// want your [GroupConversation] objects to store further information
  /// that are not defined within the Chat Package.
  ///
  final AdditionalConversationDataConfig? additionalGroupConversationData;

  const AdditionalDataInitData(
      {this.additionalDirectConversationData,
      this.additionalGroupConversationData});
}

///
/// Contains all the styling information on how you want the NEON Chat
/// to look like.
///
class StyleInitData {
  final ConversationStyle conversationStyle;
  final ConversationsStyle conversationsStyle;
  final MessageBubbleStyle messageBubbleStyle;
  final SearchAppBarStyle searchAppBarStyle;
  final BottomBarStyle bottomBarStyle;
  final PushNotificationToastStyle pushNotificationToastStyle;
  const StyleInitData({
    this.conversationStyle = const ConversationStyle(),
    this.conversationsStyle = const ConversationsStyle(),
    this.messageBubbleStyle = const MessageBubbleStyle(),
    this.searchAppBarStyle = const SearchAppBarStyle(),
    this.bottomBarStyle = const BottomBarStyle(),
    this.pushNotificationToastStyle = const PushNotificationToastStyle(),
  });
}

_registerFirebase({
  required FirebaseAuth firebaseAuth,
  required FirebaseFirestore firebaseFirestore,
  required FirebaseKeys firebaseKeys,
}) {
  if (!chatGetIt.isRegistered<FirebaseAuth>()) {
    chatGetIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  }
  if (!chatGetIt.isRegistered<FirebaseFirestore>()) {
    chatGetIt.registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
  }
  if (!chatGetIt.isRegistered<FirebaseKeys>()) {
    chatGetIt.registerLazySingleton<FirebaseKeys>(() => firebaseKeys);
  }
}

_registerStyles(StyleInitData styleInit) {
  if (!chatGetIt.isRegistered<ConversationStyle>()) {
    chatGetIt.registerLazySingleton<ConversationStyle>(
        () => styleInit.conversationStyle);
  }
  if (!chatGetIt.isRegistered<ConversationsStyle>()) {
    chatGetIt.registerLazySingleton<ConversationsStyle>(
        () => styleInit.conversationsStyle);
  }
  if (!chatGetIt.isRegistered<MessageBubbleStyle>()) {
    chatGetIt.registerLazySingleton<MessageBubbleStyle>(
        () => styleInit.messageBubbleStyle);
  }
  if (!chatGetIt.isRegistered<SearchAppBarStyle>()) {
    chatGetIt.registerLazySingleton<SearchAppBarStyle>(
        () => styleInit.searchAppBarStyle);
  }
  if (!chatGetIt.isRegistered<BottomBarStyle>()) {
    chatGetIt
        .registerLazySingleton<BottomBarStyle>(() => styleInit.bottomBarStyle);
  }
}

_registerFunctions(FunctionInitData functionInit) {
  if (!chatGetIt.isRegistered<FunctionInitData>()) {
    chatGetIt.registerLazySingleton<FunctionInitData>(() => functionInit);
  }
}

_registerWidgets(WidgetInitData widgetInit) {
  if (!chatGetIt.isRegistered<WidgetInitData>()) {
    chatGetIt.registerLazySingleton<WidgetInitData>(() => widgetInit);
  }
}

_registerAdditionalData(AdditionalDataInitData additionalDataInit) {
  if (!chatGetIt.isRegistered<AdditionalDataInitData>()) {
    chatGetIt.registerLazySingleton<AdditionalDataInitData>(
        () => additionalDataInit);
  }
}

_registerRouting(RoutingInitData routingInit) {
  if (!chatGetIt.isRegistered<RoutingInitData>()) {
    chatGetIt.registerLazySingleton<RoutingInitData>(() => routingInit);
  }
}

_registerSingletons({
  required FirebaseAuth firebaseAuth,
  required FirebaseFirestore firebaseFirestore,
  required FirebaseKeys firebaseKeys,
  required NeonChatRemoteDataSource remoteDataSource,
  required bool Function() isAuthenticated,
  required PushNotificationToastStyle pushNotificationToastStyle,
}) {
  final _currentUserUID = firebaseAuth.currentUser?.uid;

  chatGetIt.registerLazySingleton<ConversationRepository>(
    () => ConversationRepositoryImpl(
      firestore: firebaseFirestore,
      firebaseAuth: firebaseAuth,
      firebaseKeys: firebaseKeys,
    ),
  );
  chatGetIt.registerLazySingleton<ConversationsRepository>(
      () => ConversationsRepositoryImpl(
            firestore: firebaseFirestore,
            firebaseAuth: firebaseAuth,
            firebaseKeys: firebaseKeys,
            dataSource: remoteDataSource,
          ));
  chatGetIt.registerLazySingleton<FileUploadRepository>(
      () => FileUploadRepositoryImpl(remoteDataSource: remoteDataSource));
  chatGetIt.registerLazySingleton<UploadManagerRepository>(() =>
      UploadManagerRepositoryImpl(
          fileUploadRepository: chatGetIt<FileUploadRepository>()));
  chatGetIt.registerLazySingleton<FirebaseUserProfileRepository>(
      () => FirebaseUserProfileRepositoryImpl(
            firestore: firebaseFirestore,
            firebaseKeys: firebaseKeys,
          ));
  chatGetIt.registerLazySingleton<HideMessageUC>(
      () => HideMessageUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<DeleteMessageUC>(
      () => DeleteMessageUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<GetUploadUrlUC>(
      () => GetUploadUrlUC(chatGetIt<FileUploadRepository>()));
  chatGetIt.registerLazySingleton<MarkMessageAsSeenUC>(
      () => MarkMessageAsSeenUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<SearchConversationsUC>(
      () => SearchConversationsUC(_currentUserUID));
  chatGetIt.registerLazySingleton<SendPlatformFileMessageUC>(() =>
      SendPlatformFileMessageUC(
          conversationRepository: chatGetIt<ConversationRepository>(),
          uploadManagerRepository: chatGetIt<UploadManagerRepository>()));
  chatGetIt.registerLazySingleton<SendFileMessageUC>(() => SendFileMessageUC(
      conversationRepository: chatGetIt<ConversationRepository>(),
      uploadManagerRepository: chatGetIt<UploadManagerRepository>()));
  chatGetIt.registerLazySingleton<SendTextMessageUC>(
      () => SendTextMessageUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<InitializeConversationStreamUC>(
      () => InitializeConversationStreamUC(
            conversationRepository: chatGetIt<ConversationRepository>(),
            conversationsRepository: chatGetIt<ConversationsRepository>(),
          ));
  chatGetIt.registerLazySingleton<InitializeConversationItemStreamUC>(() =>
      InitializeConversationItemStreamUC(
          conversationRepository: chatGetIt<ConversationRepository>(),
          conversationsRepository: chatGetIt<ConversationsRepository>()));
  chatGetIt.registerLazySingleton<InitializeConversationsStreamUC>(() =>
      InitializeConversationsStreamUC(chatGetIt<ConversationsRepository>()));
  chatGetIt.registerLazySingleton<HideConversationUC>(
      () => HideConversationUC(chatGetIt<ConversationsRepository>()));
  chatGetIt.registerLazySingleton<GetFirebaseUserUC>(
      () => GetFirebaseUserUC(chatGetIt<FirebaseUserProfileRepository>()));
  chatGetIt.registerLazySingleton<CreateDirectConversationUC>(
      () => CreateDirectConversationUC(chatGetIt<ConversationsRepository>()));
  chatGetIt.registerLazySingleton<CreateGroupConversationUC>(
      () => CreateGroupConversationUC(chatGetIt<ConversationsRepository>()));
  chatGetIt.registerLazySingleton<InitializeTimestampStreamUC>(() =>
      InitializeTimestampStreamUC(chatGetIt<FirebaseUserProfileRepository>()));
  chatGetIt.registerLazySingleton<SyncTimestampsWithFirebaseUC>(() =>
      SyncTimestampsWithFirebaseUC(chatGetIt<FirebaseUserProfileRepository>()));
  chatGetIt.registerLazySingleton<PushNotificationService>(() =>
      PushNotificationService(
          isAuthenticated: isAuthenticated,
          remoteUploadsURL: remoteDataSource.remoteUploadsURL,
          toastStyle: pushNotificationToastStyle));

  // default headers are empty and will be overwritten if [initHttpHeaders]
  // is called.
  chatGetIt.registerLazySingleton<Map<String, String>>(() => {},
      instanceName: kHttpHeadersInstanceName);
}

_registerFactories() {
  chatGetIt.registerFactory<UploadUrlCubit>(
      () => UploadUrlCubit(chatGetIt<GetUploadUrlUC>()));

  chatGetIt.registerFactory<CurrentConversationCubit>(
      () => CurrentConversationCubit());
  chatGetIt.registerFactory<ConversationsBloc>(
    () => ConversationsBloc(
      initializeConversationsStreamUC:
          chatGetIt<InitializeConversationsStreamUC>(),
      initializeConversationItemStreamUC:
          chatGetIt<InitializeConversationItemStreamUC>(),
      hideConversationUC: chatGetIt<HideConversationUC>(),
      getFirebaseUserUC: chatGetIt<GetFirebaseUserUC>(),
      createConversationUC: chatGetIt<CreateDirectConversationUC>(),
      createGroupConversationUC: chatGetIt<CreateGroupConversationUC>(),
      initTimestampStreamUC: chatGetIt<InitializeTimestampStreamUC>(),
      syncTimestampsWithFirebaseUC: chatGetIt<SyncTimestampsWithFirebaseUC>(),
    ),
  );
  chatGetIt.registerFactory<ConversationsSearchBloc>(
      () => ConversationsSearchBloc(chatGetIt<SearchConversationsUC>()));
}
