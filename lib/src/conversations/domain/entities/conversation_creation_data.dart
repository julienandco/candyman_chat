import 'package:neon_chat/neon_chat.dart';

abstract class ConversationCreationData {}

class DirectConversationCreationData extends ConversationCreationData {
  final FirebaseUser conversationPartner;

  DirectConversationCreationData({
    required this.conversationPartner,
  });
}

class GroupConversationCreationData extends ConversationCreationData {
  final List<FirebaseUser> conversationMembers;
  final String groupName;
  final String? groupPhoto;

  GroupConversationCreationData({
    required this.conversationMembers,
    required this.groupName,
    this.groupPhoto,
  });
}
