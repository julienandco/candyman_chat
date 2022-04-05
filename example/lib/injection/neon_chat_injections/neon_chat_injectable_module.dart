import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/injection/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:neon_chat/neon_chat.dart';

@module
abstract class NEONChatInjectableModule {
  //TODO: fill the firebase keys with custom ones if needed.

  //TODO: adjust firebaseKeys environment to the environment used by getIt
  @lazySingleton
  FirebaseKeys get firebaseKeys => const FirebaseKeys();

  @LazySingleton(as: ConversationRepository)
  ConversationRepositoryImpl get conversationRepository =>
      ConversationRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: firebaseKeys,
      );

  @LazySingleton(as: ConversationsRepository)
  ConversationsRepositoryImpl get conversationsRepository =>
      ConversationsRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        firebaseKeys: firebaseKeys,
      );

  @LazySingleton(as: FileUploadRepository)
  FileUploadRepositoryImpl get fileUploadRepository =>
      FileUploadRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>());

  @LazySingleton(as: UploadManagerRepository)
  UploadManagerRepositoryImpl get uploadManagerRepository =>
      UploadManagerRepositoryImpl(fileUploadRepository: fileUploadRepository);

  @LazySingleton(as: FirebaseUserProfileRepository)
  FirebaseUserProfileRepositoryImpl get firebaseUserProfileRepository =>
      FirebaseUserProfileRepositoryImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseKeys: firebaseKeys,
      );

  @lazySingleton
  HideMessageUC get hideMessageUC => HideMessageUC(conversationRepository);

  @lazySingleton
  DeleteMessageUC get deleteMessageUC =>
      DeleteMessageUC(conversationRepository);

  @lazySingleton
  MarkMessageAsSeenUC get markAsSeenUC =>
      MarkMessageAsSeenUC(conversationRepository);

  @lazySingleton
  MarkGroupMessageAsSeenUC get markGroupMessageAsSeenUC =>
      MarkGroupMessageAsSeenUC(conversationRepository);

  @lazySingleton
  SendPlatformFileMessageUC get sendPlatformFileMessageUC =>
      SendPlatformFileMessageUC(
          conversationRepository: conversationRepository,
          uploadManagerRepository: uploadManagerRepository);

  @lazySingleton
  SendFileMessageUC get sendFileMessageUC => SendFileMessageUC(
      conversationRepository: conversationRepository,
      uploadManagerRepository: uploadManagerRepository);

  @lazySingleton
  SendTextMessageUC get sendTextMessageUC =>
      SendTextMessageUC(conversationRepository);

  @lazySingleton
  InitializeConversationStreamUC get initializeConversationStreamUC =>
      InitializeConversationStreamUC(
        conversationRepository: conversationRepository,
      );

  @lazySingleton
  InitializeConversationItemStreamUC get initializeConversationItemStreamUC =>
      InitializeConversationItemStreamUC(
        conversationRepository: conversationRepository,
        conversationsRepository: conversationsRepository,
      );

  @lazySingleton
  InitializeConversationsStreamUC get initializeConversationsStreamUC =>
      InitializeConversationsStreamUC(conversationsRepository);

  @lazySingleton
  HideConversationUC get hideConversationUC =>
      HideConversationUC(conversationsRepository);

  @lazySingleton
  GetFirebaseUserUC get getFirebaseUserUC =>
      GetFirebaseUserUC(firebaseUserProfileRepository);

  @lazySingleton
  CreateConversationUC get createConversationUC =>
      CreateConversationUC(conversationsRepository);

  @lazySingleton
  CreateGroupConversationUC get createGroupConversationUC =>
      CreateGroupConversationUC(conversationsRepository);

  @lazySingleton
  ConversationSearchBloc get conversationSearchBloc => ConversationSearchBloc();

  @lazySingleton
  CurrentConversationCubit get currentConversationCubit =>
      CurrentConversationCubit();

  // @lazySingleton
  // GetAllGroupTimestampsUC get getAllGroupTimestampsUC =>
  //     GetAllGroupTimestampsUC(neonChatCacheService);

  @lazySingleton
  ConversationsBloc get conversationsBloc => ConversationsBloc(
        initializeConversationsStreamUC: initializeConversationsStreamUC,
        initializeConversationItemStreamUC: initializeConversationItemStreamUC,
        hideConversationUC: hideConversationUC,
        getFirebaseUserUC: getFirebaseUserUC,
        createConversationUC: createConversationUC,
        createGroupConversationUC: createGroupConversationUC,
      );

  @lazySingleton
  ConversationsSearchBloc get conversationsSearchBloc =>
      ConversationsSearchBloc();

  // @lazySingleton
  // NeonChatCache get neonChatCache => NeonChatCache();

  // @lazySingleton
  // NeonChatCacheService get neonChatCacheService =>
  //     NeonChatCacheService(neonChatCache, firebaseUserProfileRepository);
}
