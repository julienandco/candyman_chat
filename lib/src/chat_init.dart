import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/conversation/domain/use_cases/get_upload_url_uc.dart';

GetIt chatGetIt = GetIt.instance;

initNEONChat({
  required FirebaseAuth firebaseAuth,
  required FirebaseFirestore firebaseFirestore,
  required FirebaseKeys firebaseKeys,
  required NeonChatRemoteDataSource remoteDataSource,
  required bool Function() isAuthenticated,
  required ConversationStyle conversationStyle,
  required ConversationsStyle conversationsStyle,
  required MessageBubbleStyle messageBubbleStyle,
  required SearchAppBarStyle searchAppBarStyle,
  required BottomBarStyle bottomBarStyle,
  required PushNotificationToastStyle pushNotificationToastStyle,
  String? remoteUploadsURL,
}) {
  final _currentUserUID = firebaseAuth.currentUser?.uid;

  //Firebase
  if (!chatGetIt.isRegistered<FirebaseAuth>()) {
    chatGetIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  }
  if (!chatGetIt.isRegistered<FirebaseFirestore>()) {
    chatGetIt.registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
  }
  chatGetIt.registerLazySingleton<FirebaseKeys>(() => firebaseKeys);

  //Styles
  chatGetIt.registerLazySingleton<ConversationStyle>(() => conversationStyle);
  chatGetIt.registerLazySingleton<ConversationsStyle>(() => conversationsStyle);
  chatGetIt.registerLazySingleton<MessageBubbleStyle>(() => messageBubbleStyle);
  chatGetIt.registerLazySingleton<SearchAppBarStyle>(() => searchAppBarStyle);
  chatGetIt.registerLazySingleton<BottomBarStyle>(() => bottomBarStyle);
  chatGetIt.registerLazySingleton<PushNotificationToastStyle>(
      () => pushNotificationToastStyle);

  //Logic
  chatGetIt.registerLazySingleton<ConversationRepository>(
    () => ConversationRepositoryImpl(
        firestore: firebaseFirestore, firebaseAuth: firebaseAuth),
  );
  chatGetIt.registerLazySingleton<ConversationsRepository>(() =>
      ConversationsRepositoryImpl(
          firestore: firebaseFirestore, firebaseAuth: firebaseAuth));
  chatGetIt.registerLazySingleton<FileUploadRepository>(
      () => FileUploadRepositoryImpl(remoteDataSource: remoteDataSource));
  chatGetIt.registerLazySingleton<UploadManagerRepository>(() =>
      UploadManagerRepositoryImpl(
          fileUploadRepository: chatGetIt<FileUploadRepository>()));
  chatGetIt.registerLazySingleton<FirebaseUserProfileRepository>(
      () => FirebaseUserProfileRepositoryImpl(firestore: firebaseFirestore));
  chatGetIt.registerLazySingleton<HideMessageUC>(
      () => HideMessageUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<DeleteMessageUC>(
      () => DeleteMessageUC(chatGetIt<ConversationRepository>()));
  chatGetIt.registerLazySingleton<GetUploadUrlUC>(
      () => GetUploadUrlUC(chatGetIt<FileUploadRepository>()));
  chatGetIt.registerLazySingleton<UploadUrlCubit>(
      () => UploadUrlCubit(chatGetIt<GetUploadUrlUC>()));
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
  chatGetIt.registerLazySingleton<InitializeConversationStreamUC>(() =>
      InitializeConversationStreamUC(
          conversationRepository: chatGetIt<ConversationRepository>()));
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

  chatGetIt.registerLazySingleton<CurrentConversationCubit>(
      () => CurrentConversationCubit());
  chatGetIt.registerLazySingleton<ConversationsBloc>(
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
  chatGetIt.registerLazySingleton<ConversationsSearchBloc>(
      () => ConversationsSearchBloc(chatGetIt<SearchConversationsUC>()));
  chatGetIt.registerLazySingleton<InitializeTimestampStreamUC>(() =>
      InitializeTimestampStreamUC(chatGetIt<FirebaseUserProfileRepository>()));
  chatGetIt.registerLazySingleton<SyncTimestampsWithFirebaseUC>(() =>
      SyncTimestampsWithFirebaseUC(chatGetIt<FirebaseUserProfileRepository>()));
  chatGetIt.registerLazySingleton<GroupConversationTimestampsBloc>(() =>
      GroupConversationTimestampsBloc(
          initStreamUC: chatGetIt<InitializeTimestampStreamUC>(),
          syncTimestampsWithFirebaseUC:
              chatGetIt<SyncTimestampsWithFirebaseUC>()));

  //TODOPUSH
  chatGetIt.registerLazySingleton<PushNotificationService>(() =>
      PushNotificationService(
          isAuthenticated: isAuthenticated,
          openConversation: (_, __) {},
          remoteUploadsURL: remoteUploadsURL,
          toastStyle: const PushNotificationToastStyle()));
}
// }
