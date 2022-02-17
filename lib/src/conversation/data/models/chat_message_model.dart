//TODO delete

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:papeo_app/core/data/models/upload_model.dart';
// import 'package:papeo_app/features/chat/domain/entities/chat_message_entity.dart';
// import 'package:papeo_app/injection.dart';

// class ChatMessageModel extends ChatMessageEntity {
//   ChatMessageModel({
//     String id = '',
//     String? text,
//     LatLng? location,
//     bool seen = false,
//     required String senderId,
//     required String receiverId,
//     DateTime? timestamp,
//     UploadModel? upload,
//     bool doneUpload = false,
//     String? filePath = '',
//     Duration? audioDuration,
//     required ChatMessageType type,
//     List<String> hiddenFrom = const [],
//   }) : super(
//           id: id,
//           text: text,
//           location: location,
//           seen: seen,
//           senderId: senderId,
//           receiverId: receiverId,
//           timestamp: timestamp,
//           upload: upload,
//           type: type,
//           doneUpload: doneUpload,
//           filePath: filePath,
//           audioDuration: audioDuration,
//           hiddenFrom: hiddenFrom,
//         );

//   factory ChatMessageModel.empty() => ChatMessageModel(
//         senderId: '',
//         receiverId: '',
//         text: '',
//         type: ChatMessageType.text,
//       );

//   Map<String, dynamic> toMap() {
//     final geoPoint = location != null
//         ? GeoPoint(location!.latitude, location!.longitude)
//         : null;
//     return {
//       'id': id,
//       'text': text,
//       'location': geoPoint,
//       'seen': seen,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'timestamp': FieldValue.serverTimestamp(),
//       'upload': upload,
//       'doneUpload': doneUpload,
//       'filePath': filePath,
//       'audioDuration': audioDuration?.inSeconds,
//       'type': type.toString().split('.').last,
//       'hiddenFrom': hiddenFrom,
//     };
//   }

//   factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
//     final geoPoint = (map['location'] as GeoPoint?);
//     LatLng? latLng;
//     if (geoPoint == null) {
//       latLng = null;
//     } else {
//       latLng = LatLng(geoPoint.latitude, geoPoint.latitude);
//     }
//     final timestamp = (map['timestamp'] as Timestamp?);

//     return ChatMessageModel(
//       id: map['id'],
//       text: map['text'],
//       location: latLng,
//       seen: map['seen'],
//       senderId: map['senderId'],
//       receiverId: map['receiverId'],
//       doneUpload: map['doneUpload'],
//       filePath: map['filePath'],
//       audioDuration: map['audioDuration'] != null
//           ? Duration(seconds: map['audioDuration'])
//           : null,
//       timestamp: timestamp?.toDate(),
//       upload: map['upload'] != null ? UploadModel.fromMap(map['upload']) : null,
//       type: ChatMessageType.values.firstWhere(
//           (element) => element.toString() == 'ChatMessageType.${map['type']}'),
//       hiddenFrom: List<String>.from(map['hiddenFrom'] ?? []),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ChatMessageModel.fromJson(String source) =>
//       ChatMessageModel.fromMap(json.decode(source));
//   String get timestampFormated =>
//       DateFormat.Hm('de').format(timestamp ?? DateTime.now());

//   bool get isMe => getIt<FirebaseAuth>().currentUser!.uid == senderId;

//   ChatMessageModel copyWith({
//     String? id,
//     String? text,
//     LatLng? location,
//     bool? seen,
//     String? senderId,
//     String? receiverId,
//     DateTime? timestamp,
//     UploadModel? upload,
//     ChatMessageType? type,
//     bool? doneUpload,
//     String? filePath,
//     Duration? audioDuration,
//   }) {
//     return ChatMessageModel(
//       id: id ?? this.id,
//       text: text ?? this.text,
//       location: location ?? this.location,
//       seen: seen ?? this.seen,
//       senderId: senderId ?? this.senderId,
//       receiverId: receiverId ?? this.receiverId,
//       timestamp: timestamp ?? this.timestamp,
//       upload: upload ?? this.upload,
//       type: type ?? this.type,
//       doneUpload: doneUpload ?? this.doneUpload,
//       filePath: filePath ?? this.filePath,
//       audioDuration: audioDuration ?? this.audioDuration,
//     );
//   }
// }
