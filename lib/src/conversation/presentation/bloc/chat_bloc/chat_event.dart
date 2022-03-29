part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.init({
    required ConversationItem conversationItem,
  }) = _Init;
  const factory ChatEvent.onData(
    List<ChatMessage> messages,
    Conversation conversation,
    String displayName,
  ) = _OnData;
  const factory ChatEvent.sendTextMessage(String message) = _SendTextMessage;
  const factory ChatEvent.sendImageMessage(String message) = _SendImageMessage;
  const factory ChatEvent.sendVoiceMessage(String message, Duration duration) =
      _SendVoiceMessage;
  const factory ChatEvent.sendVideoMessage(String message) = _SendVideoMessage;
  const factory ChatEvent.sendMultipleFiles(List<AssetEntity> files) =
      _SendMultipleFiles;
  const factory ChatEvent.sendFileMessage(PlatformFile file) = _SendFileMessage;

  const factory ChatEvent.markAsSeen(ChatMessage message) = _MarkAsSeen;
  const factory ChatEvent.deleteMessage(ChatMessage message) = _DeleteMessage;
  const factory ChatEvent.hideMessage(ChatMessage message) = _HideMessage;
}
