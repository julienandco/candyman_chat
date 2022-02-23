// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

  _Conversation call(
      {required String id,
      String? displayName,
      required List<String> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? timestamp,
      List<String> hiddenFrom = const []}) {
    return _Conversation(
      id: id,
      displayName: displayName,
      conversationMembers: conversationMembers,
      thumbnail: thumbnail,
      timestamp: timestamp,
      hiddenFrom: hiddenFrom,
    );
  }

  Conversation fromJson(Map<String, Object?> json) {
    return Conversation.fromJson(json);
  }
}

/// @nodoc
const $Conversation = _$ConversationTearOff();

/// @nodoc
mixin _$Conversation {
  String get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  List<String> get conversationMembers => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  List<String> get hiddenFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? displayName,
      List<String> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? timestamp,
      List<String> hiddenFrom});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? conversationMembers = freezed,
    Object? thumbnail = freezed,
    Object? timestamp = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hiddenFrom: hiddenFrom == freezed
          ? _value.hiddenFrom
          : hiddenFrom // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? displayName,
      List<String> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? timestamp,
      List<String> hiddenFrom});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res> extends _$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? conversationMembers = freezed,
    Object? thumbnail = freezed,
    Object? timestamp = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_Conversation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hiddenFrom: hiddenFrom == freezed
          ? _value.hiddenFrom
          : hiddenFrom // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Conversation extends _Conversation {
  _$_Conversation(
      {required this.id,
      this.displayName,
      required this.conversationMembers,
      this.thumbnail,
      @MyDateTimeConverter() this.timestamp,
      this.hiddenFrom = const []})
      : super._();

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationFromJson(json);

  @override
  final String id;
  @override
  final String? displayName;
  @override
  final List<String> conversationMembers;
  @override
  final String? thumbnail;
  @override
  @MyDateTimeConverter()
  final DateTime? timestamp;
  @JsonKey()
  @override
  final List<String> hiddenFrom;

  @override
  String toString() {
    return 'Conversation(id: $id, displayName: $displayName, conversationMembers: $conversationMembers, thumbnail: $thumbnail, timestamp: $timestamp, hiddenFrom: $hiddenFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.conversationMembers, conversationMembers) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality()
                .equals(other.hiddenFrom, hiddenFrom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(conversationMembers),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(hiddenFrom));

  @JsonKey(ignore: true)
  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationToJson(this);
  }
}

abstract class _Conversation extends Conversation {
  factory _Conversation(
      {required String id,
      String? displayName,
      required List<String> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? timestamp,
      List<String> hiddenFrom}) = _$_Conversation;
  _Conversation._() : super._();

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  String get id;
  @override
  String? get displayName;
  @override
  List<String> get conversationMembers;
  @override
  String? get thumbnail;
  @override
  @MyDateTimeConverter()
  DateTime? get timestamp;
  @override
  List<String> get hiddenFrom;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}
