// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:neon_chat/neon_chat.dart' as _i3;

import 'firebase_injectable_module.dart' as _i7;
import 'neon_chat_injections/neon_chat_injectable_module.dart' as _i6;
import 'neon_chat_injections/remote_data_source_injectable_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final nEONChatInjectableModule = _$NEONChatInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final remoteDataBaseInjectableModule = _$RemoteDataBaseInjectableModule();
  gh.lazySingleton<_i3.ChatSearchBloc>(
      () => nEONChatInjectableModule.chatSearchBloc);
  gh.lazySingleton<_i3.ConversationRepository>(
      () => nEONChatInjectableModule.conversationRepository);
  gh.lazySingleton<_i3.ConversationsBloc>(
      () => nEONChatInjectableModule.conversationsBloc);
  gh.lazySingleton<_i3.ConversationsRepository>(
      () => nEONChatInjectableModule.conversationsRepository);
  gh.lazySingleton<_i3.ConversationsSearchBloc>(
      () => nEONChatInjectableModule.conversationsSearchBloc);
  gh.lazySingleton<_i3.CreateConversationUC>(
      () => nEONChatInjectableModule.createConversationUC);
  gh.lazySingleton<_i3.CreateGroupConversationUC>(
      () => nEONChatInjectableModule.createGroupConversationUC);
  gh.lazySingleton<_i3.CurrentConversationCubit>(
      () => nEONChatInjectableModule.currentConversationCubit);
  gh.lazySingleton<_i3.DeleteMessageUC>(
      () => nEONChatInjectableModule.deleteMessageUC);
  gh.lazySingleton<_i3.FileUploadRepository>(
      () => nEONChatInjectableModule.fileUploadRepository);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i3.FirebaseKeys>(
      () => nEONChatInjectableModule.firebaseKeys);
  gh.lazySingleton<_i3.FirebaseUserProfileRepository>(
      () => nEONChatInjectableModule.firebaseUserProfileRepository);
  gh.lazySingleton<_i3.GetFirebaseUserUC>(
      () => nEONChatInjectableModule.getFirebaseUserUC);
  gh.lazySingleton<_i3.HideConversationUC>(
      () => nEONChatInjectableModule.hideConversationUC);
  gh.lazySingleton<_i3.HideMessageUC>(
      () => nEONChatInjectableModule.hideMessageUC);
  gh.lazySingleton<_i3.InitializeConversationItemStreamUC>(
      () => nEONChatInjectableModule.initializeConversationItemStreamUC);
  gh.lazySingleton<_i3.InitializeConversationStreamUC>(
      () => nEONChatInjectableModule.initializeConversationStreamUC);
  gh.lazySingleton<_i3.InitializeConversationsStreamUC>(
      () => nEONChatInjectableModule.initializeConversationsStreamUC);
  gh.lazySingleton<_i3.MarkGroupMessageAsSeenUC>(
      () => nEONChatInjectableModule.markGroupMessageAsSeenUC);
  gh.lazySingleton<_i3.MarkMessageAsSeenUC>(
      () => nEONChatInjectableModule.markAsSeenUC);
  gh.lazySingleton<_i3.RemoteDataSource>(
      () => remoteDataBaseInjectableModule.remoteDataSource);
  gh.lazySingleton<_i3.SendFileMessageUC>(
      () => nEONChatInjectableModule.sendFileMessageUC);
  gh.lazySingleton<_i3.SendPlatformFileMessageUC>(
      () => nEONChatInjectableModule.sendPlatformFileMessageUC);
  gh.lazySingleton<_i3.SendTextMessageUC>(
      () => nEONChatInjectableModule.sendTextMessageUC);
  gh.lazySingleton<_i3.UploadManagerRepository>(
      () => nEONChatInjectableModule.uploadManagerRepository);
  return get;
}

class _$NEONChatInjectableModule extends _i6.NEONChatInjectableModule {}

class _$FirebaseInjectableModule extends _i7.FirebaseInjectableModule {}

class _$RemoteDataBaseInjectableModule
    extends _i8.RemoteDataBaseInjectableModule {}
