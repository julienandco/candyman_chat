//TODO imports
import 'package:neon_chat/src/core/domain/entities/firebase_user/firebase_user.dart';

abstract class FirebaseUserProfileRepository {
  Stream<FirebaseUser> getUserProfile(String userId);
}
