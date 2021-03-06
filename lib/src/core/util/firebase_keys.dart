import 'package:neon_chat/neon_chat.dart';

enum FirebaseEnvironment { production, staging }

class FirebaseKeys {
  final bool usePrefix;
  final FirebaseEnvironment environment;

  final String stagingCollectionName;
  final String productionCollectionName;

  final String _conversationsCollectionKey;

  //Nur anfassen, wenn sich in [Conversation] etwas ändert!!! Wegen JSONSerializable!!!
  final String conversationMembersKey = 'conversationMembers';
  final String conversationHiddenFromKey = 'hiddenFrom';
  final String conversationTimestampKey = 'createdAt';
  final String conversationDoneUploadKey = 'doneUpload';
  final String conversationGroupNameKey = 'groupName';
  final String conversationGroupPictureKey = 'groupPicture';
  final String conversationIsGroupConversationKey = 'isGroupConversation';

  final String messagesInConversationKey;

  //Nur anfassen, wenn sich in [ChatMessage] etwas ändert!!! Wegen JSONSerializable!!!
  final String messageSenderIdKey = 'senderId';
  final String messageSeenKey = 'seen';
  final String messageDoneUploadKey = 'doneUpload';
  final String messageTypeKey = 'type';
  final String messageHiddenFromKey = 'hiddenFrom';
  final String messageTimestampKey = 'timestamp';

  final String _usersCollectionKey;

  //Nur anfassen, wenn sich in [FirebaseUser] etwas ändert!!! Wegen JSONSerializable!!!
  final String usersIdKey = 'id';
  final String usersProfilePictureKey = 'profilePictureURL';
  final String usersUserNameKey = 'name';
  final String usersGroupMessageSeenKey = 'groupMessageSeenTimestamps';

  // groupMessageLastSeenTimestamps
  final String groupMessageTimestampsLastUpdatedKey = 'lastUpdated';
  final String groupMessageTimestampsKey = 'timestamps';

  const FirebaseKeys({
    this.usePrefix = false,
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
    return usePrefix
        ? '$prefix-$_conversationsCollectionKey'
        : _conversationsCollectionKey;
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
    return usePrefix ? '$prefix-$_usersCollectionKey' : _usersCollectionKey;
  }
}

String getFirebaseKey(ConversationMessageType type) {
  switch (type) {
    case ConversationMessageType.text:
      return 'text';
    case ConversationMessageType.voice:
      return 'voice';
    case ConversationMessageType.image:
      return 'image';
    case ConversationMessageType.video:
      return 'video';
    case ConversationMessageType.file:
      return 'file';
    case ConversationMessageType.deleted:
      return 'deleted';
  }
}
