import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/core/core.dart';

class MyFirebaseUserListConverter
    implements JsonConverter<List<FirebaseUser>, Object?> {
  const MyFirebaseUserListConverter();

  @override
  List<FirebaseUser> fromJson(Object? json) {
    List<FirebaseUser> users = [];

    if (json != null) {
      final tmp = json as Map<String, dynamic>;
      for (var userId in tmp.keys) {
        users.add(FirebaseUser.fromJson(tmp[userId]));
      }
    }
    return users;
  }

  @override
  Map<String, dynamic> toJson(List<FirebaseUser> users) {
    Map<String, dynamic> map = {};
    for (var user in users) {
      map[user.id] = user.toJson();
    }
    return map;
  }
}
