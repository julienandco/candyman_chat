import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/router/router.dart';
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
    locale: 'de_DE',
    firebaseAuth: getIt<FirebaseAuth>(),
    firebaseFirestore: getIt<FirebaseFirestore>(),
    remoteDataSource: getIt<NeonChatRemoteDataSource>(),
    firebaseKeys: const FirebaseKeys(usePrefix: true),
    functionInit: FunctionInitData(
      getUserForID: (id) async => Future.delayed(
        const Duration(milliseconds: 250),
        () => FirebaseUser(
            id: id,
            username: 'user ${id.substring(0, 4)}',
            profilePictureURL:
                'https://cdn.getyourguide.com/img/tour/6242c553ab0ca.jpeg/146.jpg'),
      ),
      onDirectConversationAppBarTap: (conversation) =>
          log(conversation.additionalData!['startDate'].toString()),
      getConversationCreationData: () => DirectConversationCreationData(
        conversationPartner: FirebaseUser(
            id: 'ZeA12jhPSvXoO0ODxdkpXktn6QW2', username: 'Julien3'),
      ),
    ),
    routingInit: RoutingInitData(
      chatPageRoute: const ChatRoute(),
      buildConversationRoute: (convoID, showCloseButton, convosBloc) =>
          DefaultConversationRoute(
        conversationId: convoID,
        showCloseButton: showCloseButton,
        conversationsBloc: convosBloc,
      ),
      buildChatMediaViewerRoute: (title, message, conversationBloc) =>
          ChatMediaViewerRoute(
              title: title, message: message, convoBloc: conversationBloc),
    ),
    additionalDataInit: AdditionalDataInitData(
      additionalDirectConversationData: _MyCustomAdditionalData(),
    ),
    widgetInit: WidgetInitData(
      getUserAvatar: (_) => const Icon(Icons.person),
      getGroupAvatar: (_) => const Icon(Icons.group),
    ),
    styleInit: const StyleInitData(
      conversationsStyle: ConversationsStyle(
        showAppBarAboveConversations: true,
        noConversationsWidget: Text('oh man alter'),
        showFab: true,
        fabColor: Colors.red,
      ),
    ),
  );

  log(creds.user?.uid.toString() ?? 'NO CREDENTIALS!!11!!');

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    // the bloc observer is for dev purposes only
    blocObserver: _MyAppBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'NEON Chat Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser:
          _appRouter.defaultRouteParser(includePrefixMatches: true),
      routeInformationProvider: _appRouter.routeInfoProvider(),
      localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black87,
        primaryContrastingColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter.declarative(routes: (_) => const [HomeRoute()]);
  }
}

class _MyCustomAdditionalData implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos => [
        AdditionalConversationDataInfo<DateTime?, Timestamp?>(
            firebaseKey: 'startDate',
            fromJson: (json) {
              if (json == null) return null;
              return json.toDate();
            },
            toJson: (date) {
              if (date == null) return null;
              return Timestamp.fromDate(date);
            })
      ];
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
