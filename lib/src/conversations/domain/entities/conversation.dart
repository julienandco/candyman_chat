import 'package:neon_chat/neon_chat.dart';

class UnknownConversationType extends Error {}

abstract class Conversation {
  final String id;
  final String? thumbnail;
  final String displayName;
  final bool isBlockedForMe;
  final DateTime createdAt;
  final Map<String, dynamic>? additionalData;

  const Conversation({
    required this.id,
    this.thumbnail,
    required this.displayName,
    required this.isBlockedForMe,
    required this.createdAt,
    this.additionalData,
  });
}

class DirectConversation implements Conversation {
  final String _id;
  final String _displayName;
  final String? _thumbnail;
  final bool _isBlockedForMe;
  final DateTime _createdAt;
  final Map<String, dynamic>? _additionalData;

  /// Only the other user
  final FirebaseUser conversationPartner;

  DirectConversation({
    required String id,
    required String displayName,
    String? thumbnail,
    required bool isBlockedForMe,
    required DateTime createdAt,
    required this.conversationPartner,
    Map<String, dynamic>? additionalData,
  })  : _id = id,
        _isBlockedForMe = isBlockedForMe,
        _displayName = displayName,
        _thumbnail = thumbnail,
        _createdAt = createdAt,
        _additionalData = additionalData;

  factory DirectConversation.fromConversationInfo(
          {required ConversationInfo info, required FirebaseUser otherUser}) =>
      DirectConversation(
        id: info.id,
        displayName: otherUser.username,
        thumbnail: otherUser.profilePictureURL,
        isBlockedForMe: false, //TODO
        createdAt: info.createdAt,
        conversationPartner: otherUser,
        additionalData: info.additionalData,
      );

  @override
  String get displayName => _displayName;

  @override
  String get id => _id;

  @override
  String? get thumbnail => _thumbnail;

  @override
  bool get isBlockedForMe => _isBlockedForMe;

  @override
  DateTime get createdAt => _createdAt;

  @override
  Map<String, dynamic>? get additionalData => _additionalData;
}

class GroupConversation implements Conversation {
  final String _id;
  final String _displayName;
  final String? _thumbnail;
  final bool _isBlockedForMe;
  final DateTime _createdAt;
  final Map<String, dynamic>? _additionalData;

  /// Also includes the current user.
  final List<FirebaseUser> conversationMembers;

  /// Last seen timestamp for the groupchat.
  final DateTime? lastSeen;

  GroupConversation({
    required String id,
    required String displayName,
    String? thumbnail,
    required bool isBlockedForMe,
    required DateTime createdAt,
    required this.conversationMembers,
    required this.lastSeen,
    Map<String, dynamic>? additionalData,
  })  : _id = id,
        _isBlockedForMe = isBlockedForMe,
        _displayName = displayName,
        _thumbnail = thumbnail,
        _createdAt = createdAt,
        _additionalData = additionalData;

  factory GroupConversation.fromConversationInfo(
          {required ConversationInfo info,
          required List<FirebaseUser> convoMembers}) =>
      GroupConversation(
        id: info.id,
        displayName: info.groupName!,
        thumbnail: info.groupPicture,
        isBlockedForMe: false, //TODO
        createdAt: info.createdAt,
        conversationMembers: convoMembers,
        lastSeen: DateTime.now(), //TODO
        additionalData: info.additionalData,
      );

  @override
  String get displayName => _displayName;

  @override
  String get id => _id;

  @override
  String? get thumbnail => _thumbnail;

  @override
  bool get isBlockedForMe => _isBlockedForMe;

  @override
  DateTime get createdAt => _createdAt;

  @override
  Map<String, dynamic>? get additionalData => _additionalData;
}
