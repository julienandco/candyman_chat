import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

GetIt chatGetIt = GetIt.instance;
const kHttpHeadersInstanceName = 'httpHeaders';
const kOpenAppChatPageInstanceName = 'openAppChatPage';

class FunctionInitData {
  final String Function(ConversationMessageType)
      getConversationMessageTypeDisplayString;

  final Function(Conversation)? onDirectConversationAppBarTap;

  final Function(Conversation)? onGroupConversationAppBarTap;

  final ConversationCreationData Function()? getConversationCreationData;

  final Widget Function(String?)? getUserAvatar;
  final Function(String)? onOpenUserProfile;

  FunctionInitData({
    required this.getConversationMessageTypeDisplayString,
    this.onDirectConversationAppBarTap,
    this.onGroupConversationAppBarTap,
    this.getConversationCreationData,
    this.getUserAvatar,
    this.onOpenUserProfile,
  });
}

initNEONChat({
  required FirebaseAuth firebaseAuth,
  required FirebaseFirestore firebaseFirestore,
  required FirebaseKeys firebaseKeys,
  required NeonChatRemoteDataSource remoteDataSource,
  required bool Function() isAuthenticated,
  required PushNotificationToastStyle pushNotificationToastStyle,
  required void Function(BuildContext) openAppChatPage,
}) {
  try {
    final _currentUserUID = firebaseAuth.currentUser?.uid;

    //Firebase
    if (!chatGetIt.isRegistered<FirebaseAuth>()) {
      chatGetIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
    }
    if (!chatGetIt.isRegistered<FirebaseFirestore>()) {
      chatGetIt
          .registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
    }
    if (!chatGetIt.isRegistered<FirebaseKeys>()) {
      chatGetIt.registerLazySingleton<FirebaseKeys>(() => firebaseKeys);
    }

    //Push Notifications
    chatGetIt.registerLazySingleton<PushNotificationToastStyle>(
        () => pushNotificationToastStyle);

    chatGetIt.registerLazySingleton<void Function(BuildContext)>(
        () => openAppChatPage,
        instanceName: kOpenAppChatPageInstanceName);

    //Singletons (Repos, UCs, Services)
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
    chatGetIt.registerLazySingleton<CreateConversationUC>(
        () => CreateConversationUC(chatGetIt<ConversationsRepository>()));
    chatGetIt.registerLazySingleton<CreateGroupConversationUC>(
        () => CreateGroupConversationUC(chatGetIt<ConversationsRepository>()));
    chatGetIt.registerLazySingleton<InitializeTimestampStreamUC>(() =>
        InitializeTimestampStreamUC(
            chatGetIt<FirebaseUserProfileRepository>()));
    chatGetIt.registerLazySingleton<SyncTimestampsWithFirebaseUC>(() =>
        SyncTimestampsWithFirebaseUC(
            chatGetIt<FirebaseUserProfileRepository>()));
    chatGetIt.registerLazySingleton<PushNotificationService>(() =>
        PushNotificationService(
            isAuthenticated: isAuthenticated,
            remoteUploadsURL: remoteDataSource.remoteUploadsURL,
            toastStyle: pushNotificationToastStyle));

    // default headers are empty and will be overwritten if [initHttpHeaders]
    // is called.
    chatGetIt.registerLazySingleton<Map<String, String>>(() => {},
        instanceName: kHttpHeadersInstanceName);

    //Factories (Blocs, Cubits)
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
        createConversationUC: chatGetIt<CreateConversationUC>(),
        createGroupConversationUC: chatGetIt<CreateGroupConversationUC>(),
      ),
    );
    chatGetIt.registerFactory<ConversationsSearchBloc>(
        () => ConversationsSearchBloc(chatGetIt<SearchConversationsUC>()));
    chatGetIt.registerFactory<GroupConversationTimestampsBloc>(() =>
        GroupConversationTimestampsBloc(
            initStreamUC: chatGetIt<InitializeTimestampStreamUC>(),
            syncTimestampsWithFirebaseUC:
                chatGetIt<SyncTimestampsWithFirebaseUC>()));

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

initStyles({
  required ConversationStyle conversationStyle,
  required ConversationsStyle conversationsStyle,
  required MessageBubbleStyle messageBubbleStyle,
  required SearchAppBarStyle searchAppBarStyle,
  required BottomBarStyle bottomBarStyle,
}) {
  if (!chatGetIt.isRegistered<ConversationStyle>()) {
    chatGetIt.registerLazySingleton<ConversationStyle>(() => conversationStyle);
  }
  if (!chatGetIt.isRegistered<ConversationsStyle>()) {
    chatGetIt
        .registerLazySingleton<ConversationsStyle>(() => conversationsStyle);
  }
  if (!chatGetIt.isRegistered<MessageBubbleStyle>()) {
    chatGetIt
        .registerLazySingleton<MessageBubbleStyle>(() => messageBubbleStyle);
  }
  if (!chatGetIt.isRegistered<SearchAppBarStyle>()) {
    chatGetIt.registerLazySingleton<SearchAppBarStyle>(() => searchAppBarStyle);
  }
  if (!chatGetIt.isRegistered<BottomBarStyle>()) {
    chatGetIt.registerLazySingleton<BottomBarStyle>(() => bottomBarStyle);
  }
}

initFunctions(FunctionInitData functionInit) {
  if (!chatGetIt.isRegistered<FunctionInitData>()) {
    chatGetIt.registerLazySingleton<FunctionInitData>(() => functionInit);
  }
}
