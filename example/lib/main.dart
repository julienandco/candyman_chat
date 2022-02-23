import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/neon_chat.dart';

import 'firebase_options.dart';

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
    final firestore = FirebaseFirestore.instance;
    final firebaseAuth = FirebaseAuth.instance;
    final remoteDataSource = _MyDataSource();
    return MaterialApp(
      title: 'NEON Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultConversationsLoader(
        firestore: firestore,
        firebaseAuth: firebaseAuth,
        remoteDataSource: remoteDataSource,
      ),
    );
  }
}

class _MyDataSource implements RemoteDataSource {
  @override
  Future<Either<Failure, String>> deleteEndpoint(String fileId) async {
    // TODO: implement deleteEndpoint

    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> getEndpoint(String fileId) async {
    // TODO: implement getEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> patchEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement patchEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, String>> postEndpoint(
      String fileId, Map<String, dynamic> body) async {
    // TODO: implement postEndpoint
    return right('TODO');
  }

  @override
  Future<Either<Failure, Success>> uploadFileToPresignedURL(String url,
      {String? filePath,
      PlatformFile? platformFile,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    // TODO: implement uploadFileToPresignedURL
    return right(const Success());
  }
}
