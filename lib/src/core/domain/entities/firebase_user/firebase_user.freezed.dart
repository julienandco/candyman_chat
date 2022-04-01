// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firebase_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseUser _$FirebaseUserFromJson(Map<String, dynamic> json) {
  return _FirebaseUser.fromJson(json);
}

/// @nodoc
class _$FirebaseUserTearOff {
  const _$FirebaseUserTearOff();

  _FirebaseUser call(
      {required String id,
      required String name,
      String? profilePictureURL,
      @MyDateTimeConverter() DateTime? lastActivity,
      List<String> blockedUsers = const [],
      List<String> blockedByUsers = const [],
      Map<String, DateTime> groupMessageSeenTimestamps = const {}}) {
    return _FirebaseUser(
      id: id,
      name: name,
      profilePictureURL: profilePictureURL,
      lastActivity: lastActivity,
      blockedUsers: blockedUsers,
      blockedByUsers: blockedByUsers,
      groupMessageSeenTimestamps: groupMessageSeenTimestamps,
    );
  }

  FirebaseUser fromJson(Map<String, Object?> json) {
    return FirebaseUser.fromJson(json);
  }
}

/// @nodoc
const $FirebaseUser = _$FirebaseUserTearOff();

/// @nodoc
mixin _$FirebaseUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profilePictureURL => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime? get lastActivity => throw _privateConstructorUsedError;
  List<String> get blockedUsers => throw _privateConstructorUsedError;
  List<String> get blockedByUsers => throw _privateConstructorUsedError;
  Map<String, DateTime> get groupMessageSeenTimestamps =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseUserCopyWith<FirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseUserCopyWith<$Res> {
  factory $FirebaseUserCopyWith(
          FirebaseUser value, $Res Function(FirebaseUser) then) =
      _$FirebaseUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? profilePictureURL,
      @MyDateTimeConverter() DateTime? lastActivity,
      List<String> blockedUsers,
      List<String> blockedByUsers,
      Map<String, DateTime> groupMessageSeenTimestamps});
}

/// @nodoc
class _$FirebaseUserCopyWithImpl<$Res> implements $FirebaseUserCopyWith<$Res> {
  _$FirebaseUserCopyWithImpl(this._value, this._then);

  final FirebaseUser _value;
  // ignore: unused_field
  final $Res Function(FirebaseUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profilePictureURL = freezed,
    Object? lastActivity = freezed,
    Object? blockedUsers = freezed,
    Object? blockedByUsers = freezed,
    Object? groupMessageSeenTimestamps = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureURL: profilePictureURL == freezed
          ? _value.profilePictureURL
          : profilePictureURL // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActivity: lastActivity == freezed
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedByUsers: blockedByUsers == freezed
          ? _value.blockedByUsers
          : blockedByUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupMessageSeenTimestamps: groupMessageSeenTimestamps == freezed
          ? _value.groupMessageSeenTimestamps
          : groupMessageSeenTimestamps // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc
abstract class _$FirebaseUserCopyWith<$Res>
    implements $FirebaseUserCopyWith<$Res> {
  factory _$FirebaseUserCopyWith(
          _FirebaseUser value, $Res Function(_FirebaseUser) then) =
      __$FirebaseUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? profilePictureURL,
      @MyDateTimeConverter() DateTime? lastActivity,
      List<String> blockedUsers,
      List<String> blockedByUsers,
      Map<String, DateTime> groupMessageSeenTimestamps});
}

/// @nodoc
class __$FirebaseUserCopyWithImpl<$Res> extends _$FirebaseUserCopyWithImpl<$Res>
    implements _$FirebaseUserCopyWith<$Res> {
  __$FirebaseUserCopyWithImpl(
      _FirebaseUser _value, $Res Function(_FirebaseUser) _then)
      : super(_value, (v) => _then(v as _FirebaseUser));

  @override
  _FirebaseUser get _value => super._value as _FirebaseUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profilePictureURL = freezed,
    Object? lastActivity = freezed,
    Object? blockedUsers = freezed,
    Object? blockedByUsers = freezed,
    Object? groupMessageSeenTimestamps = freezed,
  }) {
    return _then(_FirebaseUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureURL: profilePictureURL == freezed
          ? _value.profilePictureURL
          : profilePictureURL // ignore: cast_nullable_to_non_nullable
              as String?,
      lastActivity: lastActivity == freezed
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedByUsers: blockedByUsers == freezed
          ? _value.blockedByUsers
          : blockedByUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupMessageSeenTimestamps: groupMessageSeenTimestamps == freezed
          ? _value.groupMessageSeenTimestamps
          : groupMessageSeenTimestamps // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseUser implements _FirebaseUser {
  _$_FirebaseUser(
      {required this.id,
      required this.name,
      this.profilePictureURL,
      @MyDateTimeConverter() this.lastActivity,
      this.blockedUsers = const [],
      this.blockedByUsers = const [],
      this.groupMessageSeenTimestamps = const {}});

  factory _$_FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profilePictureURL;
  @override
  @MyDateTimeConverter()
  final DateTime? lastActivity;
  @JsonKey()
  @override
  final List<String> blockedUsers;
  @JsonKey()
  @override
  final List<String> blockedByUsers;
  @JsonKey()
  @override
  final Map<String, DateTime> groupMessageSeenTimestamps;

  @override
  String toString() {
    return 'FirebaseUser(id: $id, name: $name, profilePictureURL: $profilePictureURL, lastActivity: $lastActivity, blockedUsers: $blockedUsers, blockedByUsers: $blockedByUsers, groupMessageSeenTimestamps: $groupMessageSeenTimestamps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirebaseUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profilePictureURL, profilePictureURL) &&
            const DeepCollectionEquality()
                .equals(other.lastActivity, lastActivity) &&
            const DeepCollectionEquality()
                .equals(other.blockedUsers, blockedUsers) &&
            const DeepCollectionEquality()
                .equals(other.blockedByUsers, blockedByUsers) &&
            const DeepCollectionEquality().equals(
                other.groupMessageSeenTimestamps, groupMessageSeenTimestamps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profilePictureURL),
      const DeepCollectionEquality().hash(lastActivity),
      const DeepCollectionEquality().hash(blockedUsers),
      const DeepCollectionEquality().hash(blockedByUsers),
      const DeepCollectionEquality().hash(groupMessageSeenTimestamps));

  @JsonKey(ignore: true)
  @override
  _$FirebaseUserCopyWith<_FirebaseUser> get copyWith =>
      __$FirebaseUserCopyWithImpl<_FirebaseUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseUserToJson(this);
  }
}

abstract class _FirebaseUser implements FirebaseUser {
  factory _FirebaseUser(
      {required String id,
      required String name,
      String? profilePictureURL,
      @MyDateTimeConverter() DateTime? lastActivity,
      List<String> blockedUsers,
      List<String> blockedByUsers,
      Map<String, DateTime> groupMessageSeenTimestamps}) = _$_FirebaseUser;

  factory _FirebaseUser.fromJson(Map<String, dynamic> json) =
      _$_FirebaseUser.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profilePictureURL;
  @override
  @MyDateTimeConverter()
  DateTime? get lastActivity;
  @override
  List<String> get blockedUsers;
  @override
  List<String> get blockedByUsers;
  @override
  Map<String, DateTime> get groupMessageSeenTimestamps;
  @override
  @JsonKey(ignore: true)
  _$FirebaseUserCopyWith<_FirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}
