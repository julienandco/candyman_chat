import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class MyDateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const MyDateTimeConverter();

  @override
  DateTime? fromJson(Object? json) {
    final tmp = json as Timestamp?;
    return tmp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? object) {
    return FieldValue.serverTimestamp();
  }
}
