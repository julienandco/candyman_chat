import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neon_chat/src/conversation/data/models/models.dart';
import 'package:neon_chat/src/core/core.dart';

part 'conversation_message.freezed.dart';
part 'conversation_message.g.dart';

enum ConversationMessageType { text, voice, image, video, file, deleted }

extension ConversationMessageTypeStrings on ConversationMessageType {
  String get firebaseKey => getFirebaseKey(this);

  // TODO: translate
  String get displayString => getFirebaseKey(this);
}

@freezed
class ConversationMessage with _$ConversationMessage {
  const ConversationMessage._();

  factory ConversationMessage({
    @Default('') String id,
    String? text,
    @MyLatLngConverter() LatLng? location,
    @Default(false) bool seen,
    required String senderId,
    @MyDateTimeConverter() DateTime? timestamp,
    Upload? upload,
    @MyConversationMessageTypeConverter() required ConversationMessageType type,
    @Default(false) bool doneUpload,
    String? filePath,
    @MyAudioDurationConverter() Duration? audioDuration,
    @Default([]) List<String> hiddenFrom,
  }) = _ConversationMessage;

  factory ConversationMessage.empty() => ConversationMessage(
        senderId: '',
        text: '',
        seen: false,
        type: ConversationMessageType.text,
      );

  factory ConversationMessage.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessageFromJson(json);

  bool get isDeleted => type == ConversationMessageType.deleted;

  String get timestampFormatted => formatDatetime(timestamp);

  //TODO get rid of the instance call
  bool get isMe => FirebaseAuth.instance.currentUser!.uid == senderId;
}
