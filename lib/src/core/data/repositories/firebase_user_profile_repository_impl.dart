//TODO
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/src/core/core.dart';

class FirebaseUserProfileRepositoryImpl
    implements FirebaseUserProfileRepository {
  FirebaseUserProfileRepositoryImpl(this.firestore)
      : _users = firestore.collection(usersCollectionKey);
  final FirebaseFirestore firestore;
  final CollectionReference _users;

  @override
  Stream<FirebaseUser> getUserProfile(String userId) {
    return _users.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          FirebaseUser>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> snap,
            EventSink<FirebaseUser> sink) async {
          final data = snap.data()!;
          data[usersIdKey] = snap.id;
          sink.add(
            FirebaseUser.fromJson(data),
          );
        },
      ),
    );
  }
}
