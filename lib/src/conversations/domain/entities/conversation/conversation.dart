import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:neon_chat/neon_chat.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const Conversation._();

  factory Conversation({
    required String id,

    ///
    /// Is null for a 1-on-1 chat and otherwise the name of the group chat.
    ///
    String? groupName,

    ///
    /// Is null for a 1-on-1 chat and otherwise the picture of the group chat.
    ///
    String? groupPicture,

    ///
    /// Maps userIds to a Map of userNames and profilePicURLs
    ///
    //TODO: rather list of firebase users? and write a custom translator
    required Map<String, Map<String, dynamic>> conversationMembers,
    // required List<String> conversationMembers,

    @MyDateTimeConverter() DateTime? createdAt,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  //TODO: injection?
  /// return whether the conversation is hidden from the current user
  /// //TODO: add firebase rule such that hidden stuff does not even get sent back
  bool get isHidden => hiddenFrom.contains(
        FirebaseAuth.instance.currentUser!.uid,
        // (element) => element == getIt<FirebaseAuth>().currentUser!.uid,
      );

  bool get isGroupChat => conversationMembers.length > 2;

  //TODO: errorprone
  String get displayName {
    if (isGroupChat) {
      return groupName ?? 'group'; //TODO: what to do?
    } else {
      final otherUserID = conversationMembers.keys.firstWhere(
          (userID) => userID != FirebaseAuth.instance.currentUser!.uid);
      final otherUserMap = conversationMembers[otherUserID]!;
      return otherUserMap[GetIt.instance<FirebaseKeys>().usersUserNameKey]!;
    }
  }

  String? get thumbnail {
    if (isGroupChat) {
      return groupPicture;
    } else {
      final otherUserID = conversationMembers.keys.firstWhere(
          (userID) => userID != FirebaseAuth.instance.currentUser!.uid);
      final otherUserMap = conversationMembers[otherUserID]!;
      return otherUserMap[
          GetIt.instance<FirebaseKeys>().usersProfilePictureKey];
    }
  }
}
