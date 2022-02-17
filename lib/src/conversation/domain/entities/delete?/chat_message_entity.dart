// import 'package:equatable/equatable.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //TODO: delete
// import 'package:neon_chat/src/core/domain/entities/upload_entity/upload_entity.dart';

// enum ChatMessageType { text, voice, image, video, file, deleted }

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

//   bool get isDeleted => type == ChatMessageType.deleted;
// }
