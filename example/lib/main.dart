import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';

import 'firebase_options.dart';
import 'injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app(); // if already initialized, use that one
  }

  configureInjection(Env.dev);

  // Hive.initFlutter();
  // Hive.registerAdapter(TimestampMapAdapter());

  final creds = await FirebaseAuth.instance.signInWithEmailAndPassword(
    password: 'neon-chat-example!',
    email: 'julien@neon.dev',
  );

  NeonChat.initNeonChat(
    firebaseAuth: getIt<FirebaseAuth>(),
    firebaseFirestore: getIt<FirebaseFirestore>(),
    remoteDataSource: getIt<NeonChatRemoteDataSource>(),
    firebaseKeys: const FirebaseKeys(usePrefix: true),
    openAppChatPage: (context) => Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const Scaffold(
          body: NeonChat(
            provideConversationsBloc: true,
            conversationsStyle: ConversationsStyle(
              showAppBarAboveConversations: true,
              noConversationsWidget: Text('oh man alter'),
            ),
          ),
        ),
      ),
    ),
  );

  print(creds.user?.uid);
  // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //   password: 'neon-chat-example1!',
  //   email: 'julien+1@neon.dev',
  // );
  // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //   password: 'neon-chat-example2!',
  //   email: 'julien+2@neon.dev',
  // );

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    // the bloc observer is for dev purposes only
    blocObserver: _MyAppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  DirectConversationCreationData get _getMockConvoCreationData =>
      DirectConversationCreationData(
          conversationPartner: FirebaseUser(
              id: '74Kx3Rn957SYoiAvSiqaYGQ7auk1', name: 'Julien7'));
  GroupConversationCreationData get _getMockGroupConvoCreationData =>
      GroupConversationCreationData(conversationMembers: [
        FirebaseUser(id: '74Kx3Rn957SYoiAvSiqaYGQ7auk1', name: 'Julien7'),
        FirebaseUser(id: '94Kx3Rn957SYoiAvSiqaYGQ7auk1', name: 'Julien9'),
      ], groupName: 'gruppe-test-2');

  /// Uncomment the [MyCustomConversationsLoader] to see a custom implementation
  /// that only uses the chat's logic.
  ///
  /// Uncomment the [NeonChat] to see the default look and usage of the NEON Chat.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEON Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'HOME!',
            ),
            const SizedBox(height: 12),
            TextButton(
              child: const Text('Chat'),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const Scaffold(
                    body: NeonChat(
                      provideConversationsBloc: true,
                      conversationsStyle: ConversationsStyle(
                        showAppBarAboveConversations: true,
                        noConversationsWidget: Text('oh man alter'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              child: const Text('Open Conversation'),
              onPressed: () => openConversationFromPushNotification(
                context,
                conversationId: 'yNluhxKbPb3lDKX3KvCO',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyAppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(
      'State change: ${change.currentState.runtimeType} --> ${change.nextState.runtimeType}',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Created with initial state: ${bloc.state.runtimeType}',
        name: '${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Closed.', name: '${bloc.runtimeType})');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(
      'Error',
      name: '${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event: ${event.runtimeType}', name: '${bloc.runtimeType}');
  }
}
