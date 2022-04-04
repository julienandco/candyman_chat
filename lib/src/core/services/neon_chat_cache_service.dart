import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neon_chat/neon_chat.dart';

class NeonChatCacheService {
  final NeonChatCache cache;
  final FirebaseUserProfileRepository userRepo;

  const NeonChatCacheService(
    this.cache,
    this.userRepo,
  );

  //TODOGROUPSEEN: upload to firebase regularly

  Future<TimestampMap> _initializeCache() async {
    final _currentUser = FirebaseAuth.instance.currentUser!;
    TimestampMap? timestamps =
        await userRepo.getUserGroupChatTimestamps(_currentUser.uid);
    if (timestamps != null) {
      print('CACHE SERVICE GOT FROM FIREBASE: $timestamps');
      // if not-null, write to cache
      cache.setGroupMessageTimestamps(timestamps);
    } else {
      timestamps = await userRepo
          .initializeFirebaseUserGroupChatTimestamps(_currentUser.uid);
      print('CACHE SERVICE WRITES TO CACHE: ${timestamps.toString()}');
      cache.setGroupMessageTimestamps(timestamps);
    }

    return timestamps;
  }

  // //TODOGROUPSEEN: needed?
  // Future<Timestamp?> getTimestampForGroupChat(String groupChatID) async {
  //   String? timestampMapCacheString = await cache.groupMessageTimestamps;

  //   TimestampMap timestampMap;

  //   if (timestampMapCacheString != null) {
  //     print('CACHE SERVICE FETCHED FROM CACHE: $timestampMapCacheString');
  //     timestampMap =
  //         TimestampMap.fromJSON(json.decode(timestampMapCacheString));
  //   } else {
  //     timestampMap = await _initializeCache();
  //   }

  //   final groupChatDate = timestampMap.timestamps[groupChatID];
  //   return groupChatDate;
  // }

  Future<TimestampMap> get groupchatsTimestampMap async {
    TimestampMap? timestampMap = await cache.groupMessageTimestamps;

    if (timestampMap != null) {
      print('found in cache');
      print(timestampMap.toString());
      return timestampMap;
    } else {
      print('init...');
      return await _initializeCache();
    }
  }
}
