import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:neon_chat/src/core/core.dart';

class MyFirebaseUserListConverter
    implements JsonConverter<List<FirebaseUser>, Object?> {
  const MyFirebaseUserListConverter();

  @override
  List<FirebaseUser> fromJson(Object? json) {
    // List<FirebaseUser> users = [];

    if (json == null) return [];

    final tmp = json as List<dynamic>;
    return List<FirebaseUser>.from(tmp
        .map((userID) => chatGetIt<FunctionInitData>().getUserForID(userID)));
    // final tmp = json as Map<String, dynamic>;
    // for (var userId in tmp.keys) {
    //   users.add(FirebaseUser.fromJson(tmp[userId]));
    // }

    // return users;
  }

  // @override
  // Map<String, dynamic> toJson(List<FirebaseUser> users) {
  // Map<String, dynamic> map = {};
  // for (var user in users) {
  //   final userMap = user.toJson();
  //   map[user.id] = userMap;
  // }
  // return map;
  // }

  @override
  List<String> toJson(List<FirebaseUser> users) {
    return List<String>.from(users.map((user) => user.id));
    // Map<String, dynamic> map = {};
    // for (var user in users) {
    //   final userMap = user.toJson();
    //   map[user.id] = userMap;
    // }
    // return map;
  }
}
