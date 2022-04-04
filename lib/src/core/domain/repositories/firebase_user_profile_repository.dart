import 'package:neon_chat/src/core/core.dart';

abstract class FirebaseUserProfileRepository {
  Stream<FirebaseUser> getUserProfile(String userId);
  Future<TimestampMap?> getUserGroupChatTimestamps(String userId);
  Future<TimestampMap> initializeFirebaseUserGroupChatTimestamps(String userId);
}
