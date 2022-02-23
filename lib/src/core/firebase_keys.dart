import 'package:neon_chat/neon_chat.dart';

enum FirebaseEnvironment { production, staging }

class FirebaseKeys {
  final FirebaseEnvironment environment;

  final String stagingCollectionName;
  final String productionCollectionName;

  final String _conversationsCollectionKey;

  final String conversationMembersKey;
  final String conversationHiddenFromKey;

  final String messagesInConversationKey;
  final String messageSenderIdKey;
  final String messageSeenKey;
  final String messageDoneUploadKey;

  final String _usersCollectionKey;
  final String usersIdKey;

  const FirebaseKeys({
    this.environment = FirebaseEnvironment.staging,
    this.stagingCollectionName = 'staging',
    this.productionCollectionName = 'production',
    String conversationsCollectionKey = 'conversations',
    this.conversationMembersKey = 'conversationMembers',
    this.conversationHiddenFromKey = 'hiddenFrom',
    this.messagesInConversationKey = 'messages',
    this.messageSenderIdKey = 'senderId',
    this.messageSeenKey = 'seen',
    this.messageDoneUploadKey = 'doneUpload',
    String usersCollectionKey = 'users',
    this.usersIdKey = 'id',
  })  : _conversationsCollectionKey = conversationsCollectionKey,
        _usersCollectionKey = usersCollectionKey;

  String get conversationsCollectionKey {
    String prefix = '';
    switch (environment) {
      case FirebaseEnvironment.production:
        prefix = productionCollectionName;
        break;
      case FirebaseEnvironment.staging:
        prefix = stagingCollectionName;
        break;
    }
    return '$prefix-$_conversationsCollectionKey';
  }

  String get usersCollectionKey {
    String prefix = '';
    switch (environment) {
      case FirebaseEnvironment.production:
        prefix = productionCollectionName;
        break;
      case FirebaseEnvironment.staging:
        prefix = stagingCollectionName;
        break;
    }
    return '$prefix-$_usersCollectionKey';
  }
}

String getFirebaseKey(ChatMessageType type) {
  switch (type) {
    case ChatMessageType.text:
      return 'text';
    case ChatMessageType.voice:
      return 'voice';
    case ChatMessageType.image:
      return 'image';
    case ChatMessageType.video:
      return 'video';
    case ChatMessageType.file:
      return 'file';
    case ChatMessageType.deleted:
      return 'deleted';
  }
}
