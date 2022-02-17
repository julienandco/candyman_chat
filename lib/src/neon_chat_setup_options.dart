import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neon_chat/src/core/domain/entities/request_responses.dart';

class NEONChatSetupOptions {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final Future<Either<Failure, String>> Function(String fileId) deleteEndpoint;
  final Future<Either<Failure, String>> Function(String fileId) getEndpoint;
  final Future<Either<Failure, String>> Function(
      String fileId, Map<String, dynamic> body) patchEndpoint;
  final Future<Either<Failure, String>> Function(
      String fileId, Map<String, dynamic> body) postEndpoint;

  final Future<Either<Failure, Success>> Function(
    String url, {
    String? filePath,
    PlatformFile? platformFile,
    void Function(int, int)? onReceiveProgress,
  }) uploadFileToPresignedURL;

  const NEONChatSetupOptions({
    required this.firebaseAuth,
    required this.firestore,
    required this.deleteEndpoint,
    required this.getEndpoint,
    required this.patchEndpoint,
    required this.postEndpoint,
    required this.uploadFileToPresignedURL,
  });
}
