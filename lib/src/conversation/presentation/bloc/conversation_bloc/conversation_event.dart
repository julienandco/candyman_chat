part of 'conversation_bloc.dart';

@freezed
class ConversationEvent with _$ConversationEvent {
  // const factory ConversationEvent.init({
  //   required ConversationItem conversationItem,
  // }) = _Init;
  const factory ConversationEvent.onData(
    List<ConversationMessage> messages,
    Conversation conversation,
    String displayName,
  ) = _OnData;
  const factory ConversationEvent.sendTextMessage(String message) =
      _SendTextMessage;
  const factory ConversationEvent.sendImageMessage(String message) =
      _SendImageMessage;
  const factory ConversationEvent.sendVoiceMessage(
      String message, Duration duration) = _SendVoiceMessage;
  const factory ConversationEvent.sendVideoMessage(String message) =
      _SendVideoMessage;
  const factory ConversationEvent.sendMultipleFiles(List<AssetEntity> files) =
      _SendMultipleFiles;
  const factory ConversationEvent.sendFileMessage(PlatformFile file) =
      _SendFileMessage;

  const factory ConversationEvent.markAsSeen(ConversationMessage message) =
      _MarkAsSeen;

  const factory ConversationEvent.deleteMessage(ConversationMessage message) =
      _DeleteMessage;
  const factory ConversationEvent.hideMessage(ConversationMessage message) =
      _HideMessage;
}
