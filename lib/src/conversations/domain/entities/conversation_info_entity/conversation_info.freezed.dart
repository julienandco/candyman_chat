// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationInfo _$ConversationInfoFromJson(Map<String, dynamic> json) {
  return _ConversationInfo.fromJson(json);
}

/// @nodoc
class _$ConversationInfoTearOff {
  const _$ConversationInfoTearOff();

  _ConversationInfo call(
      {required String id,
      required bool isGroupConversation,
      required List<String> conversationMembers,
      String? groupName,
      String? groupPicture,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom = const []}) {
    return _ConversationInfo(
      id: id,
      isGroupConversation: isGroupConversation,
      conversationMembers: conversationMembers,
      groupName: groupName,
      groupPicture: groupPicture,
      createdAt: createdAt,
      hiddenFrom: hiddenFrom,
    );
  }

  ConversationInfo fromJson(Map<String, Object?> json) {
    return ConversationInfo.fromJson(json);
  }
}

/// @nodoc
const $ConversationInfo = _$ConversationInfoTearOff();

/// @nodoc
mixin _$ConversationInfo {
  String get id => throw _privateConstructorUsedError;
  bool get isGroupConversation => throw _privateConstructorUsedError;

  ///
  /// Has two elements for a 1-on-1 conversation and n elements for a group
  /// conversation.
  ///
  List<String> get conversationMembers => throw _privateConstructorUsedError;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the name of the group
  /// conversation.
  ///
  String? get groupName => throw _privateConstructorUsedError;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the upload id of the
  /// group conversation thumbnail
  ///
  String? get groupPicture => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<String> get hiddenFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationInfoCopyWith<ConversationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationInfoCopyWith<$Res> {
  factory $ConversationInfoCopyWith(
          ConversationInfo value, $Res Function(ConversationInfo) then) =
      _$ConversationInfoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      bool isGroupConversation,
      List<String> conversationMembers,
      String? groupName,
      String? groupPicture,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom});
}

/// @nodoc
class _$ConversationInfoCopyWithImpl<$Res>
    implements $ConversationInfoCopyWith<$Res> {
  _$ConversationInfoCopyWithImpl(this._value, this._then);

  final ConversationInfo _value;
  // ignore: unused_field
  final $Res Function(ConversationInfo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isGroupConversation = freezed,
    Object? conversationMembers = freezed,
    Object? groupName = freezed,
    Object? groupPicture = freezed,
    Object? createdAt = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isGroupConversation: isGroupConversation == freezed
          ? _value.isGroupConversation
          : isGroupConversation // ignore: cast_nullable_to_non_nullable
              as bool,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupName: groupName == freezed
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupPicture: groupPicture == freezed
          ? _value.groupPicture
          : groupPicture // ignore: cast_nullable_to_non_nullable
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
abstract class _$ConversationInfoCopyWith<$Res>
    implements $ConversationInfoCopyWith<$Res> {
  factory _$ConversationInfoCopyWith(
          _ConversationInfo value, $Res Function(_ConversationInfo) then) =
      __$ConversationInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      bool isGroupConversation,
      List<String> conversationMembers,
      String? groupName,
      String? groupPicture,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom});
}

/// @nodoc
class __$ConversationInfoCopyWithImpl<$Res>
    extends _$ConversationInfoCopyWithImpl<$Res>
    implements _$ConversationInfoCopyWith<$Res> {
  __$ConversationInfoCopyWithImpl(
      _ConversationInfo _value, $Res Function(_ConversationInfo) _then)
      : super(_value, (v) => _then(v as _ConversationInfo));

  @override
  _ConversationInfo get _value => super._value as _ConversationInfo;

  @override
  $Res call({
    Object? id = freezed,
    Object? isGroupConversation = freezed,
    Object? conversationMembers = freezed,
    Object? groupName = freezed,
    Object? groupPicture = freezed,
    Object? createdAt = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_ConversationInfo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isGroupConversation: isGroupConversation == freezed
          ? _value.isGroupConversation
          : isGroupConversation // ignore: cast_nullable_to_non_nullable
              as bool,
      conversationMembers: conversationMembers == freezed
          ? _value.conversationMembers
          : conversationMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupName: groupName == freezed
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupPicture: groupPicture == freezed
          ? _value.groupPicture
          : groupPicture // ignore: cast_nullable_to_non_nullable
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
class _$_ConversationInfo implements _ConversationInfo {
  _$_ConversationInfo(
      {required this.id,
      required this.isGroupConversation,
      required this.conversationMembers,
      this.groupName,
      this.groupPicture,
      @MyDateTimeConverter() this.createdAt,
      this.hiddenFrom = const []});

  factory _$_ConversationInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationInfoFromJson(json);

  @override
  final String id;
  @override
  final bool isGroupConversation;
  @override

  ///
  /// Has two elements for a 1-on-1 conversation and n elements for a group
  /// conversation.
  ///
  final List<String> conversationMembers;
  @override

  ///
  /// Is null for a 1-on-1 conversation and otherwise the name of the group
  /// conversation.
  ///
  final String? groupName;
  @override

  ///
  /// Is null for a 1-on-1 conversation and otherwise the upload id of the
  /// group conversation thumbnail
  ///
  final String? groupPicture;
  @override
  @MyDateTimeConverter()
  final DateTime? createdAt;
  @JsonKey()
  @override
  final List<String> hiddenFrom;

  @override
  String toString() {
    return 'ConversationInfo(id: $id, isGroupConversation: $isGroupConversation, conversationMembers: $conversationMembers, groupName: $groupName, groupPicture: $groupPicture, createdAt: $createdAt, hiddenFrom: $hiddenFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationInfo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.isGroupConversation, isGroupConversation) &&
            const DeepCollectionEquality()
                .equals(other.conversationMembers, conversationMembers) &&
            const DeepCollectionEquality().equals(other.groupName, groupName) &&
            const DeepCollectionEquality()
                .equals(other.groupPicture, groupPicture) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.hiddenFrom, hiddenFrom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isGroupConversation),
      const DeepCollectionEquality().hash(conversationMembers),
      const DeepCollectionEquality().hash(groupName),
      const DeepCollectionEquality().hash(groupPicture),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(hiddenFrom));

  @JsonKey(ignore: true)
  @override
  _$ConversationInfoCopyWith<_ConversationInfo> get copyWith =>
      __$ConversationInfoCopyWithImpl<_ConversationInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationInfoToJson(this);
  }
}

abstract class _ConversationInfo implements ConversationInfo {
  factory _ConversationInfo(
      {required String id,
      required bool isGroupConversation,
      required List<String> conversationMembers,
      String? groupName,
      String? groupPicture,
      @MyDateTimeConverter() DateTime? createdAt,
      List<String> hiddenFrom}) = _$_ConversationInfo;

  factory _ConversationInfo.fromJson(Map<String, dynamic> json) =
      _$_ConversationInfo.fromJson;

  @override
  String get id;
  @override
  bool get isGroupConversation;
  @override

  ///
  /// Has two elements for a 1-on-1 conversation and n elements for a group
  /// conversation.
  ///
  List<String> get conversationMembers;
  @override

  ///
  /// Is null for a 1-on-1 conversation and otherwise the name of the group
  /// conversation.
  ///
  String? get groupName;
  @override

  ///
  /// Is null for a 1-on-1 conversation and otherwise the upload id of the
  /// group conversation thumbnail
  ///
  String? get groupPicture;
  @override
  @MyDateTimeConverter()
  DateTime? get createdAt;
  @override
  List<String> get hiddenFrom;
  @override
  @JsonKey(ignore: true)
  _$ConversationInfoCopyWith<_ConversationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
