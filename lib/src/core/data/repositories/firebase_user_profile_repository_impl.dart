import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/src/core/core.dart';

class FirebaseUserProfileRepositoryImpl
    implements FirebaseUserProfileRepository {
  FirebaseUserProfileRepositoryImpl({
    required this.firestore,
    this.firebaseKeys = const FirebaseKeys(),
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

  // @override
  // Future<TimestampMap?> getUserGroupChatTimestamps(String userId) async {
  //   try {
  //     final userData = await _users.doc(userId).get()
  //       ..data();
  //     final timestampJson = userData[firebaseKeys.usersGroupMessageSeenKey];
  //     print('TIMESTAMP MAP FETCHED FROM FIREBASE: $timestampJson');
  //     return timestampJson == null
  //         ? null
  //         : TimestampMap.fromJson(timestampJson);
  //   } catch (e) {
  //     log('Error when getting timestamps', name: '$runtimeType', error: e);
  //     rethrow;
  //   }
  // }

  @override
  Stream<Map<String, DateTime>> getUserGroupChatTimestamps(String userId) {
    return _users.doc(userId).snapshots().transform(
      StreamTransformer<DocumentSnapshot<Map<String, dynamic>>,
          Map<String, DateTime>>.fromHandlers(
        handleData: (DocumentSnapshot<Map<String, dynamic>> snap,
            EventSink<Map<String, DateTime>> sink) async {
          final data = snap.data()![firebaseKeys.usersGroupMessageSeenKey];

          print(data);
          Map<String, DateTime> timestamps = {};
          if (data != null) {
            for (var key in data.keys) {
              final timestamp = data[key] as Timestamp;
              timestamps[key] = timestamp.toDate();
            }
          }

          print('fetched: $timestamps');

          sink.add(timestamps);
        },
      ),
    );
  }

//TODOCACHE
  // @override
  // Future<TimestampMap> initializeFirebaseUserGroupChatTimestamps(
  //     String userId) async {
  //   //TODOGROUPSEEN
  //   try {
  //     final user = _users.doc(userId);

  //     final lastUpdate = FieldValue.serverTimestamp();

  //     final map = await user.update({
  //       firebaseKeys.usersGroupMessageSeenKey: {
  //         TimestampMap.lastUpdateKey: lastUpdate,
  //         TimestampMap.timestampsKey: {},
  //       }
  //     });

  //     return TimestampMap(
  //       // lastUpdate: DateTime.now(),
  //       timestamps: {},
  //     );
  //   } catch (err) {
  //     log('$err', name: '$runtimeType');
  //     rethrow;
  //   }
  // }

  @override
  void setUserGroupConversationTimestamps(
      {required String userId,
      required Map<String, DateTime> timestamps}) async {
    try {
      final doc = _users.doc(userId);

      print('newStamps: $timestamps');

      await doc.update({
        firebaseKeys.usersGroupMessageSeenKey: timestamps,
      });

      log('user group conversation timestamps updated', name: '$runtimeType');
    } catch (err) {
      log('$err', name: '$runtimeType');
      rethrow;
    }
  }
}
