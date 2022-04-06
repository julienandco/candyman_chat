import 'package:neon_chat/src/core/core.dart';

abstract class FirebaseUserProfileRepository {
  Stream<FirebaseUser> getUserProfile(String userId);
  Stream<Map<String, DateTime>> getUserGroupConversationTimestamps(
      String userId);
  void setUserGroupConversationTimestamps(
      {required String userId, required Map<String, DateTime> timestamps});
}
