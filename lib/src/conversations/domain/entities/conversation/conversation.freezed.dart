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
      String? groupName,
      required Map<String, Map<String, String?>> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom = const []}) {
    return _Conversation(
      id: id,
      groupName: groupName,
      conversationMembers: conversationMembers,
      thumbnail: thumbnail,
      createdAt: createdAt,
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

  ///
  /// Is null for a 1-on-1 chat and otherwise the name of the group chat.
  ///
  String? get groupName => throw _privateConstructorUsedError;

  ///
  /// Maps userIds to a Map of userNames and profilePicURLs
  ///
//TODO: rather list of firebase users? and write a custom translator
  Map<String, Map<String, String?>> get conversationMembers =>
      throw _privateConstructorUsedError; // required List<String> conversationMembers,
  ///
  /// The thumbnail of a conversation is either the profile picture of the
  /// other user in a 1-on-1 chat or the group picture in a group chat.
  ///
  String? get thumbnail => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
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
      String? groupName,
      Map<String, Map<String, String?>> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? createdAt,
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
    Object? groupName = freezed,
    Object? conversationMembers = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: groupName == freezed
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String?>>,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
      String? groupName,
      Map<String, Map<String, String?>> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? createdAt,
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
    Object? groupName = freezed,
    Object? conversationMembers = freezed,
    Object? thumbnail = freezed,
    Object? createdAt = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_Conversation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: groupName == freezed
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String?>>,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
      this.groupName,
      required this.conversationMembers,
      this.thumbnail,
      @MyDateTimeConverter() this.createdAt,
      this.hiddenFrom = const []})
      : super._();

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationFromJson(json);

  @override
  final String id;
  @override

  ///
  /// Is null for a 1-on-1 chat and otherwise the name of the group chat.
  ///
  final String? groupName;
  @override

  ///
  /// Maps userIds to a Map of userNames and profilePicURLs
  ///
//TODO: rather list of firebase users? and write a custom translator
  final Map<String, Map<String, String?>> conversationMembers;
  @override // required List<String> conversationMembers,
  ///
  /// The thumbnail of a conversation is either the profile picture of the
  /// other user in a 1-on-1 chat or the group picture in a group chat.
  ///
  final String? thumbnail;
  @override
  @MyDateTimeConverter()
  final DateTime? createdAt;
  @JsonKey()
  @override
  final List<String> hiddenFrom;

  @override
  String toString() {
    return 'Conversation(id: $id, groupName: $groupName, conversationMembers: $conversationMembers, thumbnail: $thumbnail, createdAt: $createdAt, hiddenFrom: $hiddenFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.groupName, groupName) &&
            const DeepCollectionEquality()
                .equals(other.conversationMembers, conversationMembers) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.hiddenFrom, hiddenFrom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(groupName),
      const DeepCollectionEquality().hash(conversationMembers),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(createdAt),
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
      String? groupName,
      required Map<String, Map<String, String?>> conversationMembers,
      String? thumbnail,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom}) = _$_Conversation;
  _Conversation._() : super._();

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  String get id;
  @override

  ///
  /// Is null for a 1-on-1 chat and otherwise the name of the group chat.
  ///
  String? get groupName;
  @override

  ///
  /// Maps userIds to a Map of userNames and profilePicURLs
  ///
//TODO: rather list of firebase users? and write a custom translator
  Map<String, Map<String, String?>> get conversationMembers;
  @override // required List<String> conversationMembers,
  ///
  /// The thumbnail of a conversation is either the profile picture of the
  /// other user in a 1-on-1 chat or the group picture in a group chat.
  ///
  String? get thumbnail;
  @override
  @MyDateTimeConverter()
  DateTime? get createdAt;
  @override
  List<String> get hiddenFrom;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}
