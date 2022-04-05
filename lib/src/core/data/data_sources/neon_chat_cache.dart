// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// //TODOCACHE

// class NeonChatCache {
//   static const _kCacheName = 'neonChatCache';
//   static const _kGroupMessageTimestampsKey = 'groupMessageTimestamps';

//   static const _kGroupMessageTimestampsIndex = 0;
//   Box? hive;

//   Future<void> _getDatabase() async {
//     hive ??= await Hive.openBox(_kCacheName);
//   }

//   Future<void> openHive() async {
//     if (hive != null && !hive!.isOpen) {
//       hive = await Hive.openBox(_kCacheName);
//     }
//   }

//   Future<void> closeHive() async {
//     if (hive != null && hive!.isOpen) {
//       Hive.close();
//     }
//   }

//   Future<String?> getCachedString(String key) async {
//     try {
//       await _getDatabase();
//       dynamic jsonString = hive!.get(key);
//       return jsonString;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<bool> hasRecordForKey(String key) async {
//     await _getDatabase();
//     return hive!.containsKey(key);
//   }

//   Future<void> setCachedString(String key, String jsonString) async {
//     await _getDatabase();
//     return hive!.put(key, jsonString);
//   }

//   Future<void> removeCachedEntry(String key) async {
//     await _getDatabase();
//     return hive!.delete(key);
//   }

//   Future<TimestampMap?> get groupMessageTimestamps async {
//     await _getDatabase();
//     return await hive!.getAt(_kGroupMessageTimestampsIndex);
//     // return await getCachedString(_kGroupMessageTimestampsKey);
//   }

//   Future<void> setGroupMessageTimestamps(TimestampMap timestampMap) async {
//     await _getDatabase();

//     return hive!.putAt(_kGroupMessageTimestampsIndex, timestampMap);
//     // return hive!.put(_kGroupMessageTimestampsKey, timestampMap);
//   }

//   //TODOGROUPSEEN: needed?
//   Future<void> deleteGroupMessageTimestamps() async {
//     await removeCachedEntry(_kGroupMessageTimestampsKey);
//   }
// }
