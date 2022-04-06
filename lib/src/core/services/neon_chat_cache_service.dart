//TODOCACHE

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:neon_chat/neon_chat.dart';

// class NeonChatCacheService {
//   final NeonChatCache cache;
//   final FirebaseUserProfileRepository userRepo;

//   const NeonChatCacheService(
//     this.cache,
//     this.userRepo,
//   );


//   Future<TimestampMap> _initializeCache() async {
//     // final _currentUser = FirebaseAuth.instance.currentUser!;
//     // TimestampMap? timestamps =
//     //     await userRepo.getUserGroupChatTimestamps(_currentUser.uid);
//     // if (timestamps != null) {
//     //   print('CACHE SERVICE GOT FROM FIREBASE: $timestamps');
//     //   // if not-null, write to cache
//     //   cache.setGroupMessageTimestamps(timestamps);
//     // } else {
//     //   print(
//     //       'NOTHING FOUND IN FIREBASE, INITIALIZING TIMESTAMPS IN FIREBASE...');
//     //   timestamps = await userRepo
//     //       .initializeFirebaseUserGroupChatTimestamps(_currentUser.uid);
//     //   print('CACHE SERVICE WRITES TO CACHE: ${timestamps.toString()}');
//     //   cache.setGroupMessageTimestamps(timestamps);
//     // }

//     // return timestamps;
//     return TimestampMap(timestamps: {});
//   }

//   Future<TimestampMap> get groupchatsTimestampMap async {
//     TimestampMap? timestampMap = await cache.groupMessageTimestamps;

//     if (timestampMap != null) {
//       print('found in cache');
//       print(timestampMap.toString());
//       return timestampMap;
//     } else {
//       print('fetching from firebase...');
//       return await _initializeCache();
//     }
//   }
// }
