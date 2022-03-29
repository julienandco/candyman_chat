import 'package:neon_chat/neon_chat.dart';

enum FirebaseEnvironment { production, staging }

class FirebaseKeys {
  final FirebaseEnvironment environment;

  final String stagingCollectionName;
  final String productionCollectionName;

  final String _conversationsCollectionKey;

  //Nur anfassen, wenn sich in [Conversation] etwas ändert!!! Wegen JSONSerializable!!!
  final String conversationMembersKey = 'conversationMembers';
  final String conversationHiddenFromKey = 'hiddenFrom';
  final String conversationTimestampKey = 'timestamp';
  final String conversationDoneUploadKey = 'doneUpload';
  final String conversationDisplayNameKey = 'displayName';
  final String conversationThumbnailKey = 'thumbnail';

  final String messagesInConversationKey;

  //Nur anfassen, wenn sich in [ChatMessage] etwas ändert!!! Wegen JSONSerializable!!!
  final String messageSenderIdKey = 'senderId';
  final String messageSeenKey = 'seen';
  final String messageDoneUploadKey = 'doneUpload';
  final String messageTypeKey = 'type';
  final String messageHiddenFromKey = 'hiddenFrom';

  final String _usersCollectionKey;

  //Nur anfassen, wenn sich in [FirebaseUser] etwas ändert!!! Wegen JSONSerializable!!!
  final String usersIdKey = 'id';

  const FirebaseKeys({
    this.environment = FirebaseEnvironment.staging,
    this.stagingCollectionName = 'staging',
    this.productionCollectionName = 'production',
    String conversationsCollectionKey = 'conversations',
    this.messagesInConversationKey = 'messages',
    String usersCollectionKey = 'users',
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
