import 'package:neon_chat/neon_chat.dart';

class UnknownConversationType extends Error {}

abstract class Conversation {
  final String id;
  final String thumbnail;
  final String displayName;
  final bool isBlockedForMe;

  const Conversation({
    required this.id,
    required this.thumbnail,
    required this.displayName,
    required this.isBlockedForMe,
  });
}

class DirectConversation implements Conversation {
  final String _id;
  final String _displayName;
  final String _thumbnail;
  final bool _isBlockedForMe;

  /// Only the other user
  final FirebaseUser conversationPartner;

  DirectConversation(
      {required String id,
      required String displayName,
      required String thumbnail,
      required bool isBlockedForMe,
      required this.conversationPartner})
      : _id = id,
        _isBlockedForMe = isBlockedForMe,
        _displayName = displayName,
        _thumbnail = thumbnail;

  @override
  String get displayName => _displayName;

  @override
  String get id => _id;

  @override
  String get thumbnail => _thumbnail;

  @override
  bool get isBlockedForMe => _isBlockedForMe;
}

class GroupConversation implements Conversation {
  final String _id;
  final String _displayName;
  final String _thumbnail;
  final bool _isBlockedForMe;

  /// Also includes the current user.
  final List<FirebaseUser> conversationMembers;

  /// Last seen timestamp for the groupchat.
  final DateTime? lastSeen;

  GroupConversation({
    required String id,
    required String displayName,
    required String thumbnail,
    required bool isBlockedForMe,
    required this.conversationMembers,
    required this.lastSeen,
  })  : _id = id,
        _isBlockedForMe = isBlockedForMe,
        _displayName = displayName,
        _thumbnail = thumbnail;

  @override
  String get displayName => _displayName;

  @override
  String get id => _id;

  @override
  String get thumbnail => _thumbnail;

  @override
  bool get isBlockedForMe => _isBlockedForMe;
}
