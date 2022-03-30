import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/src/core/core.dart';

part 'firebase_user.freezed.dart';
part 'firebase_user.g.dart';

@freezed
class FirebaseUser with _$FirebaseUser {
  factory FirebaseUser({
    required String id,
    required String name,
    String? profilePictureURL,
    @MyDateTimeConverter() DateTime? lastActivity,
    required List<String> blockedUsers,
    required List<String> blockedByUsers,
  }) = _FirebaseUser;

  factory FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserFromJson(json);
}
