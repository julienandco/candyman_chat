import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:neon_chat/src/core/core.dart';

part 'groupchat_timestamps_map.g.dart';
part 'groupchat_timestamps_map.freezed.dart';

@freezed
class TimestampMap with _$TimestampMap {
  static const lastUpdateKey = 'lastUpdate';
  static const timestampsKey = 'timestamps';

  @HiveType(typeId: 0)
  factory TimestampMap({
    @MyNonNullableDateTimeConverter()
    @HiveField(0)
        required DateTime lastUpdate,
    @MyDateTimeMapConverter()
    @HiveField(1)
        required Map<String, DateTime> timestamps,
  }) = _TimestampMap;

  factory TimestampMap.fromJson(Map<String, dynamic> json) =>
      _$TimestampMapFromJson(json);
}
