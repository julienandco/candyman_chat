// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'groupchat_timestamps_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimestampMap _$TimestampMapFromJson(Map<String, dynamic> json) {
  return _TimestampMap.fromJson(json);
}

/// @nodoc
class _$TimestampMapTearOff {
  const _$TimestampMapTearOff();

  _TimestampMap call(
      {@MyNonNullableDateTimeConverter()
      @HiveField(0)
          required DateTime lastUpdate,
      @MyDateTimeMapConverter()
      @HiveField(1)
          required Map<String, DateTime> timestamps}) {
    return _TimestampMap(
      lastUpdate: lastUpdate,
      timestamps: timestamps,
    );
  }

  TimestampMap fromJson(Map<String, Object?> json) {
    return TimestampMap.fromJson(json);
  }
}

/// @nodoc
const $TimestampMap = _$TimestampMapTearOff();

/// @nodoc
mixin _$TimestampMap {
  @MyNonNullableDateTimeConverter()
  @HiveField(0)
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  @MyDateTimeMapConverter()
  @HiveField(1)
  Map<String, DateTime> get timestamps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimestampMapCopyWith<TimestampMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimestampMapCopyWith<$Res> {
  factory $TimestampMapCopyWith(
          TimestampMap value, $Res Function(TimestampMap) then) =
      _$TimestampMapCopyWithImpl<$Res>;
  $Res call(
      {@MyNonNullableDateTimeConverter()
      @HiveField(0)
          DateTime lastUpdate,
      @MyDateTimeMapConverter()
      @HiveField(1)
          Map<String, DateTime> timestamps});
}

/// @nodoc
class _$TimestampMapCopyWithImpl<$Res> implements $TimestampMapCopyWith<$Res> {
  _$TimestampMapCopyWithImpl(this._value, this._then);

  final TimestampMap _value;
  // ignore: unused_field
  final $Res Function(TimestampMap) _then;

  @override
  $Res call({
    Object? lastUpdate = freezed,
    Object? timestamps = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timestamps: timestamps == freezed
          ? _value.timestamps
          : timestamps // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc
abstract class _$TimestampMapCopyWith<$Res>
    implements $TimestampMapCopyWith<$Res> {
  factory _$TimestampMapCopyWith(
          _TimestampMap value, $Res Function(_TimestampMap) then) =
      __$TimestampMapCopyWithImpl<$Res>;
  @override
  $Res call(
      {@MyNonNullableDateTimeConverter()
      @HiveField(0)
          DateTime lastUpdate,
      @MyDateTimeMapConverter()
      @HiveField(1)
          Map<String, DateTime> timestamps});
}

/// @nodoc
class __$TimestampMapCopyWithImpl<$Res> extends _$TimestampMapCopyWithImpl<$Res>
    implements _$TimestampMapCopyWith<$Res> {
  __$TimestampMapCopyWithImpl(
      _TimestampMap _value, $Res Function(_TimestampMap) _then)
      : super(_value, (v) => _then(v as _TimestampMap));

  @override
  _TimestampMap get _value => super._value as _TimestampMap;

  @override
  $Res call({
    Object? lastUpdate = freezed,
    Object? timestamps = freezed,
  }) {
    return _then(_TimestampMap(
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timestamps: timestamps == freezed
          ? _value.timestamps
          : timestamps // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$_TimestampMap implements _TimestampMap {
  _$_TimestampMap(
      {@MyNonNullableDateTimeConverter() @HiveField(0) required this.lastUpdate,
      @MyDateTimeMapConverter() @HiveField(1) required this.timestamps});

  factory _$_TimestampMap.fromJson(Map<String, dynamic> json) =>
      _$$_TimestampMapFromJson(json);

  @override
  @MyNonNullableDateTimeConverter()
  @HiveField(0)
  final DateTime lastUpdate;
  @override
  @MyDateTimeMapConverter()
  @HiveField(1)
  final Map<String, DateTime> timestamps;

  @override
  String toString() {
    return 'TimestampMap(lastUpdate: $lastUpdate, timestamps: $timestamps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimestampMap &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate) &&
            const DeepCollectionEquality()
                .equals(other.timestamps, timestamps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastUpdate),
      const DeepCollectionEquality().hash(timestamps));

  @JsonKey(ignore: true)
  @override
  _$TimestampMapCopyWith<_TimestampMap> get copyWith =>
      __$TimestampMapCopyWithImpl<_TimestampMap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimestampMapToJson(this);
  }
}

abstract class _TimestampMap implements TimestampMap {
  factory _TimestampMap(
      {@MyNonNullableDateTimeConverter()
      @HiveField(0)
          required DateTime lastUpdate,
      @MyDateTimeMapConverter()
      @HiveField(1)
          required Map<String, DateTime> timestamps}) = _$_TimestampMap;

  factory _TimestampMap.fromJson(Map<String, dynamic> json) =
      _$_TimestampMap.fromJson;

  @override
  @MyNonNullableDateTimeConverter()
  @HiveField(0)
  DateTime get lastUpdate;
  @override
  @MyDateTimeMapConverter()
  @HiveField(1)
  Map<String, DateTime> get timestamps;
  @override
  @JsonKey(ignore: true)
  _$TimestampMapCopyWith<_TimestampMap> get copyWith =>
      throw _privateConstructorUsedError;
}
