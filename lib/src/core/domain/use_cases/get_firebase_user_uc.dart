import 'package:neon_chat/src/core/core.dart';

class GetFirebaseUserUC {
  GetFirebaseUserUC(this.userRepository);

  FirebaseUserProfileRepository userRepository;

  Stream<FirebaseUser> call({
    required String userId,
  }) {
    return userRepository.getUserProfile(userId);
  }
}
