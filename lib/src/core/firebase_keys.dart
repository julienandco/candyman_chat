import 'package:neon_chat/neon_chat.dart';

const conversationsCollectionKey = 'conversations';

const conversationMembersKey = 'conversationMembers';
const conversationHiddenFromKey = 'hiddenFrom';

const messagesInConversationKey = 'messages';
const messageSenderIdKey = 'senderId';
const messageSeenKey = 'seen';
const messageDoneUploadKey = 'doneUpload';

const usersCollectionKey = 'users';
const usersIdKey = 'id';

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
