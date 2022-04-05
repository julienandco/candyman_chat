import 'dart:async';

import 'package:neon_chat/neon_chat.dart';

class InitializeTimestampStreamUC {
  final FirebaseUserProfileRepository userRepo;

  const InitializeTimestampStreamUC(this.userRepo);

  StreamSubscription<Map<String, DateTime>> call({
    required String userID,
    required void Function(dynamic)? onData,
  }) {
    return userRepo.getUserGroupChatTimestamps(userID).listen(onData);
  }
}
