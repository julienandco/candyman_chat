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
    /// Is null for a 1-on-1 conversation and otherwise the name of the group
    /// conversation.
    ///
    String? groupName,

    ///
    /// Is null for a 1-on-1 conversation and otherwise the picture of the
    /// group conversation.
    ///
    String? groupPicture,

    ///
    /// Has two elements for a 1-on-1 conversation and n elements for a group
    /// conversation.
    ///
    @MyFirebaseUserListConverter()
        required List<FirebaseUser> conversationMembers,
    required bool isGroupConversation,
    @MyDateTimeConverter() DateTime? createdAt,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  /// Returns whether the conversation is hidden from the current user
  bool get isHidden => hiddenFrom.contains(
        GetIt.instance<FirebaseAuth>().currentUser!.uid,
      );

  /// The name that is shown to the user. Either group name for group
  /// conversations or conversation partner's name for 1-on-1 conversations.
  ///
  String get displayName {
    //TODO: add currentUserUID as Argument, so we can get rid of thie firebase auth call here
    if (isGroupConversation) {
      return groupName ?? 'group'; //TODO: what to do?
    } else {
      final otherUser = conversationMembers.firstWhere(
          (userID) => userID.id != FirebaseAuth.instance.currentUser!.uid);
      return otherUser.name;
    }
  }

  /// The url of the picture that is shown to the user inside the avatar.
  /// Either group picture for group conversations or conversation partner's
  /// avatar for 1-on-1 conversations.
  ///
  String? get thumbnail {
    if (isGroupConversation) {
      return groupPicture;
    } else {
      final otherUser = conversationMembers.firstWhere(
          (userID) => userID.id != FirebaseAuth.instance.currentUser!.uid);
      return otherUser.profilePictureURL;
    }
  }

  bool get isBlocked {
    if (isGroupConversation) {
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

  /// Getter for 1-on-1 conversations, that returns the direct conversation partner.
  FirebaseUser? getConversationPartner(String? myId) {
    if (isGroupConversation || myId == null) return null;
    return conversationMembers.firstWhere((member) => member.id != myId);
  }
}
