import 'package:neon_chat/src/core/core.dart';

abstract class FirebaseUserProfileRepository {
  Stream<FirebaseUser> getUserProfile(String userId);
  Stream<Map<String, DateTime>> getUserGroupChatTimestamps(String userId);
  void setUserGroupConversationTimestamps(
      {required String userId, required Map<String, DateTime> timestamps});

  //TODOGROUPSEEN: needed?
  // Future<TimestampMap> initializeFirebaseUserGroupChatTimestamps(String userId);
}
