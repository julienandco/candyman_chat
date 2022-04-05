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
    /// Has two elements for a 1-on-1 chat and n elements for a group chat.
    ///
    @MyFirebaseUserListConverter()
        required List<FirebaseUser> conversationMembers,
    required bool isGroupChat,
    @MyDateTimeConverter() DateTime? createdAt,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  /// Returns whether the conversation is hidden from the current user
  bool get isHidden => hiddenFrom.contains(
        GetIt.instance<FirebaseAuth>().currentUser!.uid,
      );

  /// The name that is shown to the user. Either group name for group chats
  /// or conversation partner's name for 1-on-1 chats.
  ///
  String get displayName {
    //TODO: add currentUserUID as Argument, so we can get rid of thie firebase auth call here
    if (isGroupChat) {
      return groupName ?? 'group'; //TODO: what to do?
    } else {
      final otherUser = conversationMembers.firstWhere(
          (userID) => userID.id != FirebaseAuth.instance.currentUser!.uid);
      return otherUser.name;
    }
  }

  /// The url of the picture that is shown to the user inside the avatar.
  /// Either group picture for group chats or conversation partner's avatar
  ///  for 1-on-1 chats.
  ///
  String? get thumbnail {
    if (isGroupChat) {
      return groupPicture;
    } else {
      final otherUser = conversationMembers.firstWhere(
          (userID) => userID.id != FirebaseAuth.instance.currentUser!.uid);
      return otherUser.profilePictureURL;
    }
  }

  bool get isBlocked {
    if (isGroupChat) {
      //TODO
      return false;
    } else {
      final firstUser = conversationMembers.first;
      final secondUser = conversationMembers.last;

      if (firstUser.blockedUsers.contains(secondUser.id) ||
          firstUser.blockedByUsers.contains(secondUser.id) ||
          secondUser.blockedUsers.contains(firstUser.id) ||
          secondUser.blockedByUsers.contains(firstUser.id)) {
        return true;
      }
      return false;
    }
  }

  /// Getter for 1-on-1 chats, that returns the direct conversation partner.
  FirebaseUser? getConversationPartner(String? myId) {
    if (isGroupChat || myId == null) return null;
    return conversationMembers.firstWhere((member) => member.id != myId);
  }
}
