import 'package:neon_chat/neon_chat.dart';

class SyncTimestampsWithFirebaseUC {
  final FirebaseUserProfileRepository userRepo;

  const SyncTimestampsWithFirebaseUC(this.userRepo);

  void call({
    required String userId,
    required Map<String, DateTime> map,
  }) async {
    return userRepo.setUserGroupConversationTimestamps(
        userId: userId, timestamps: map);
  }
}
