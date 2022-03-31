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

  final creds = await FirebaseAuth.instance.signInWithEmailAndPassword(
    password: 'neon-chat-example!',
    email: 'julien@neon.dev',
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<FirebaseUser> get _getMockConvoPartner =>
      [FirebaseUser(id: 'w4Kx3Rn957SYoiAvSiqaYGQ7auk1', name: 'Julien7')];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEON Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: // const MyCustomConversationsLoader()
          // Uncomment the next lines to see the default look of the app
          NeonChat(
        getItInstance: getIt,
        getNewConversationPartners: () => _getMockConvoPartner,
      ),
    );
  }
}
