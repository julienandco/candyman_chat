import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/src/core/core.dart';

class FirebaseUserProfileRepositoryImpl
    implements FirebaseUserProfileRepository {
  FirebaseUserProfileRepositoryImpl({
    required this.firestore,
    required this.firebaseKeys,
  }) : _users = firestore.collection(firebaseKeys.usersCollectionKey);
  final FirebaseFirestore firestore;
  final FirebaseKeys firebaseKeys;
  final CollectionReference _users;

  @override
  Stream<FirebaseUser> getUserProfile(String userId) {
    return _users.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          FirebaseUser>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> snap,
            EventSink<FirebaseUser> sink) async {
          final data = snap.data()!;
          data[firebaseKeys.usersIdKey] = snap.id;
          sink.add(
            FirebaseUser.fromJson(data),
          );
        },
      ),
    );
  }

  @override
  Stream<Map<String, DateTime>> getUserGroupConversationTimestamps(
      String userId) {
    return _users.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          Map<String, DateTime>>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> snap,
            EventSink<Map<String, DateTime>> sink) async {
          final data = snap.data();
          Map<String, DateTime> timestamps = {};

          if (data != null) {
            final timestampGeneralData =
                snap.data()![firebaseKeys.usersGroupMessageSeenKey];

            if (timestampGeneralData != null) {
              final timestampData =
                  data[firebaseKeys.groupMessageTimestampsKey];
              if (timestampData != null) {
                for (var key in timestampData.keys) {
                  final timestamp = timestampData[key] as Timestamp;
                  timestamps[key] = timestamp.toDate();
                }
              }
            }
          }

          log('fetched group conversation timestamps for user $userId: $timestamps',
              name: '$runtimeType');

          sink.add(timestamps);
        },
      ),
    );
  }

  @override
  void setUserGroupConversationTimestamps(
      {required String userId,
      required Map<String, DateTime> timestamps}) async {
    try {
      final doc = _users.doc(userId);

      Map<String, dynamic> timestampsInfo = {
        firebaseKeys.groupMessageTimestampsLastUpdatedKey:
            FieldValue.serverTimestamp(),
        firebaseKeys.groupMessageTimestampsKey: timestamps,
      };

      await doc.update({
        firebaseKeys.usersGroupMessageSeenKey: timestampsInfo,
      });

      log('user group conversation timestamps updated: $timestamps',
          name: '$runtimeType');
    } catch (err) {
      log('$err', name: '$runtimeType');
      rethrow;
    }
  }
}
