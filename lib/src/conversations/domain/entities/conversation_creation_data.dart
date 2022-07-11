import 'package:neon_chat/neon_chat.dart';

abstract class ConversationCreationData {
  final Map<String, dynamic>? additionalData;

  const ConversationCreationData(this.additionalData);
}

class DirectConversationCreationData implements ConversationCreationData {
  final FirebaseUser conversationPartner;
  final Map<String, dynamic>? _additionalData;

  DirectConversationCreationData({
    required this.conversationPartner,
    Map<String, dynamic>? additionalData,
  }) : _additionalData = additionalData;

  @override
  Map<String, dynamic>? get additionalData => _additionalData;
}

class GroupConversationCreationData implements ConversationCreationData {
  final List<FirebaseUser> conversationMembers;
  final String groupName;
  final String? groupPhoto;
  final Map<String, dynamic>? _additionalData;

  GroupConversationCreationData({
    required this.conversationMembers,
    required this.groupName,
    this.groupPhoto,
    Map<String, dynamic>? additionalData,
  }) : _additionalData = additionalData;

  @override
  Map<String, dynamic>? get additionalData => _additionalData;
}
