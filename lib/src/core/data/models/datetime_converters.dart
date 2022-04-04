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

class MyNonNullableDateTimeConverter
    implements JsonConverter<DateTime, Object?> {
  const MyNonNullableDateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    final tmp = json as Timestamp?;
    return tmp?.toDate() ?? DateTime(1970);
  }

  @override
  FieldValue toJson(DateTime? object) {
    return FieldValue.serverTimestamp();
  }
}

class MyDateTimeMapConverter
    implements JsonConverter<Map<String, DateTime>, Object?> {
  const MyDateTimeMapConverter();

  @override
  Map<String, DateTime> fromJson(Object? json) {
    final tmp = json as Map<String, dynamic>;
    Map<String, DateTime> map = {};
    for (var key in tmp.keys) {
      map[key] = (tmp[key] as Timestamp?)?.toDate() ?? DateTime(1970);
    }
    return map;
  }

  @override
  Map<String, Timestamp> toJson(Map<String, DateTime> object) {
    Map<String, Timestamp> map = {};
    for (var key in object.keys) {
      map[key] = Timestamp.fromDate(object[key] ?? DateTime(1970));
    }
    return map;
  }
}
