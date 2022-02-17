import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:neon_chat/src/core/data/models/my_latlng_converter.dart';

//TODO: imports
import 'package:neon_chat/src/core/domain/entities/upload/upload.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum ChatMessageType { text, voice, image, video, file, deleted }

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
    DateTime? timestamp,
    Upload? upload,
    required ChatMessageType type,
    @Default(false) bool doneUpload,
    String? filePath,
    Duration? audioDuration,
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
      DateFormat.Hm('de').format(timestamp ?? DateTime.now());

  bool get isMe => FirebaseAuth.instance.currentUser!.uid == senderId;

//TODO: injection in package?
  // bool get isMe => getIt<FirebaseAuth>().currentUser!.uid == senderId;
}

// class ChatMessageEntity extends Equatable {
//   final String id;
//   final String? text;
//   final LatLng? location;
//   final bool seen;
//   final String senderId;
//   final String receiverId;
//   final DateTime? timestamp;
//   final UploadEntity? upload;
//   final ChatMessageType type;
//   final bool doneUpload;
//   final String? filePath;
//   final Duration? audioDuration;
//   final List<String> hiddenFrom;

//   ChatMessageEntity({
//     this.id = '',
//     this.text,
//     required this.location,
//     required this.seen,
//     required this.senderId,
//     required this.receiverId,
//     this.doneUpload = false,
//     this.timestamp,
//     this.upload,
//     this.filePath,
//     required this.type,
//     this.audioDuration,
//     this.hiddenFrom = const [],
//   });

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       text,
//       location,
//       seen,
//       senderId,
//       receiverId,
//       timestamp,
//       upload,
//       type,
//       doneUpload,
//       filePath,
//       audioDuration,
//       hiddenFrom,
//     ];
//   }


