import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

import 'firebase_options.dart';
import 'injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureInjection(Env.dev);

  await FirebaseAuth.instance.signInWithEmailAndPassword(
    password: 'neon-chat-example!',
    email: 'julien@neon.dev',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEON Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: // const MyCustomConversationsLoader()
          // Uncomment the next lines to see the default look of the app
          DefaultConversationsLoader(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        remoteDataSource: getIt<RemoteDataSource>(),
        defaultConverstionsStyle: DefaultConverstionsStyle(
          appBarTitle: const Text('NEON DEFAULT CHAT'),
          defaultChatListItem:
              DefaultChatListItem(listTileColor: Colors.grey[200]!),
        ),
        defaultSearchAppBarStyle: const DefaultSearchAppBarStyle(
            textFieldDecoration: InputDecoration(
                hintText: '...',
                hintStyle: TextStyle(color: Colors.white38),
                border: InputBorder.none),
            serachBarDecoration:
                BoxDecoration(color: Color.fromARGB(255, 25, 5, 55))),
        defaultBottomBarStyle: const DefaultBottomBarStyle(
            textFieldDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Message...',
                hintStyle: TextStyle(color: Colors.black38))),
      ),
    );
  }
}
