import 'package:example/chat/conversations/conversations_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

/// Die zwei Test-User, die in der FirebaseAuth hinterlegt sind.
const firebaseUsers = [
  'w4KxTRn95eSYoiAvSiqaYGQ7auk1',
  'tAqmmpKhZecyewN53YmdOseiw2u2'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.signInWithEmailAndPassword(
    password: 'neon-chat-test!',
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
        primarySwatch: Colors.blue,
      ),
      home: const ConversationsLoader(),
    );
  }
}
