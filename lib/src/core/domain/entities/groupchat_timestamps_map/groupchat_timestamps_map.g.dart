// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupchat_timestamps_map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimestampMapAdapter extends TypeAdapter<_$_TimestampMap> {
  @override
  final int typeId = 0;

  @override
  _$_TimestampMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TimestampMap(
      lastUpdate: fields[0] as DateTime,
      timestamps: (fields[1] as Map).cast<String, DateTime>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_TimestampMap obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lastUpdate)
      ..writeByte(1)
      ..write(obj.timestamps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimestampMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimestampMap _$$_TimestampMapFromJson(Map<String, dynamic> json) =>
    _$_TimestampMap(
      lastUpdate:
          const MyNonNullableDateTimeConverter().fromJson(json['lastUpdate']),
      timestamps: const MyDateTimeMapConverter().fromJson(json['timestamps']),
    );

Map<String, dynamic> _$$_TimestampMapToJson(_$_TimestampMap instance) =>
    <String, dynamic>{
      'lastUpdate':
          const MyNonNullableDateTimeConverter().toJson(instance.lastUpdate),
      'timestamps': const MyDateTimeMapConverter().toJson(instance.timestamps),
    };
