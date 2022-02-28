import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:neon_chat/src/conversation/data/models/models.dart';
import 'package:neon_chat/src/core/core.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum ChatMessageType { text, voice, image, video, file, deleted }

extension ChatMessageTypeStrings on ChatMessageType {
  String get firebaseKey => getFirebaseKey(this);

  //TODO
  String get displayString => getFirebaseKey(this);
}

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  factory ChatMessage({
    @Default('') String id,
    String? text,
    @MyLatLngConverter() LatLng? location,
    @Default(false) bool seen,
    required String senderId,
    required String receiverId,
    @MyDateTimeConverter() DateTime? timestamp,
    Upload? upload,
    @MyChatMessageTypeConverter() required ChatMessageType type,
    @Default(false) bool doneUpload,
    String? filePath,
    @MyAudioDurationConverter() Duration? audioDuration,
    @Default([]) List<String> hiddenFrom,
  }) = _ChatMessage;

  factory ChatMessage.empty() => ChatMessage(
        senderId: '',
        receiverId: '',
        text: '',
        seen: false,
        type: ChatMessageType.text,
      );

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  bool get isDeleted => type == ChatMessageType.deleted;

  //TODO: get correct locale, not hardcoded de
  String get timestampFormated =>
      //DateFormat.Hm('de').format(timestamp ?? DateTime.now());

      DateFormat('HH:mm').format(timestamp!);
  // timestamp?.toIso8601String() ?? DateTime.now().toIso8601String();

  bool get isMe => FirebaseAuth.instance.currentUser!.uid == senderId;

//TODO: injection in package?
  // bool get isMe => getIt<FirebaseAuth>().currentUser!.uid == senderId;
}
