// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_conversation_timestamps_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GroupConversationTimestampsEventTearOff {
  const _$GroupConversationTimestampsEventTearOff();

  _InitializeTimestamps initialize(String userID) {
    return _InitializeTimestamps(
      userID,
    );
  }

  _OnDataReceived onData(Map<String, DateTime> timestamps) {
    return _OnDataReceived(
      timestamps,
    );
  }

  _SetNewTimestampForConversation setNewTimestamp(
      {required String conversationId, required DateTime timestamp}) {
    return _SetNewTimestampForConversation(
      conversationId: conversationId,
      timestamp: timestamp,
    );
  }
}

/// @nodoc
const $GroupConversationTimestampsEvent =
    _$GroupConversationTimestampsEventTearOff();

/// @nodoc
mixin _$GroupConversationTimestampsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) initialize,
    required TResult Function(Map<String, DateTime> timestamps) onData,
    required TResult Function(String conversationId, DateTime timestamp)
        setNewTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeTimestamps value) initialize,
    required TResult Function(_OnDataReceived value) onData,
    required TResult Function(_SetNewTimestampForConversation value)
        setNewTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupConversationTimestampsEventCopyWith<$Res> {
  factory $GroupConversationTimestampsEventCopyWith(
          GroupConversationTimestampsEvent value,
          $Res Function(GroupConversationTimestampsEvent) then) =
      _$GroupConversationTimestampsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupConversationTimestampsEventCopyWithImpl<$Res>
    implements $GroupConversationTimestampsEventCopyWith<$Res> {
  _$GroupConversationTimestampsEventCopyWithImpl(this._value, this._then);

  final GroupConversationTimestampsEvent _value;
  // ignore: unused_field
  final $Res Function(GroupConversationTimestampsEvent) _then;
}

/// @nodoc
abstract class _$InitializeTimestampsCopyWith<$Res> {
  factory _$InitializeTimestampsCopyWith(_InitializeTimestamps value,
          $Res Function(_InitializeTimestamps) then) =
      __$InitializeTimestampsCopyWithImpl<$Res>;
  $Res call({String userID});
}

/// @nodoc
class __$InitializeTimestampsCopyWithImpl<$Res>
    extends _$GroupConversationTimestampsEventCopyWithImpl<$Res>
    implements _$InitializeTimestampsCopyWith<$Res> {
  __$InitializeTimestampsCopyWithImpl(
      _InitializeTimestamps _value, $Res Function(_InitializeTimestamps) _then)
      : super(_value, (v) => _then(v as _InitializeTimestamps));

  @override
  _InitializeTimestamps get _value => super._value as _InitializeTimestamps;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_InitializeTimestamps(
      userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InitializeTimestamps implements _InitializeTimestamps {
  const _$_InitializeTimestamps(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'GroupConversationTimestampsEvent.initialize(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitializeTimestamps &&
            const DeepCollectionEquality().equals(other.userID, userID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userID));

  @JsonKey(ignore: true)
  @override
  _$InitializeTimestampsCopyWith<_InitializeTimestamps> get copyWith =>
      __$InitializeTimestampsCopyWithImpl<_InitializeTimestamps>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) initialize,
    required TResult Function(Map<String, DateTime> timestamps) onData,
    required TResult Function(String conversationId, DateTime timestamp)
        setNewTimestamp,
  }) {
    return initialize(userID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
  }) {
    return initialize?.call(userID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeTimestamps value) initialize,
    required TResult Function(_OnDataReceived value) onData,
    required TResult Function(_SetNewTimestampForConversation value)
        setNewTimestamp,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _InitializeTimestamps
    implements GroupConversationTimestampsEvent {
  const factory _InitializeTimestamps(String userID) = _$_InitializeTimestamps;

  String get userID;
  @JsonKey(ignore: true)
  _$InitializeTimestampsCopyWith<_InitializeTimestamps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnDataReceivedCopyWith<$Res> {
  factory _$OnDataReceivedCopyWith(
          _OnDataReceived value, $Res Function(_OnDataReceived) then) =
      __$OnDataReceivedCopyWithImpl<$Res>;
  $Res call({Map<String, DateTime> timestamps});
}

/// @nodoc
class __$OnDataReceivedCopyWithImpl<$Res>
    extends _$GroupConversationTimestampsEventCopyWithImpl<$Res>
    implements _$OnDataReceivedCopyWith<$Res> {
  __$OnDataReceivedCopyWithImpl(
      _OnDataReceived _value, $Res Function(_OnDataReceived) _then)
      : super(_value, (v) => _then(v as _OnDataReceived));

  @override
  _OnDataReceived get _value => super._value as _OnDataReceived;

  @override
  $Res call({
    Object? timestamps = freezed,
  }) {
    return _then(_OnDataReceived(
      timestamps == freezed
          ? _value.timestamps
          : timestamps // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc

class _$_OnDataReceived implements _OnDataReceived {
  const _$_OnDataReceived(this.timestamps);

  @override
  final Map<String, DateTime> timestamps;

  @override
  String toString() {
    return 'GroupConversationTimestampsEvent.onData(timestamps: $timestamps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnDataReceived &&
            const DeepCollectionEquality()
                .equals(other.timestamps, timestamps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(timestamps));

  @JsonKey(ignore: true)
  @override
  _$OnDataReceivedCopyWith<_OnDataReceived> get copyWith =>
      __$OnDataReceivedCopyWithImpl<_OnDataReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) initialize,
    required TResult Function(Map<String, DateTime> timestamps) onData,
    required TResult Function(String conversationId, DateTime timestamp)
        setNewTimestamp,
  }) {
    return onData(timestamps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
  }) {
    return onData?.call(timestamps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(timestamps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeTimestamps value) initialize,
    required TResult Function(_OnDataReceived value) onData,
    required TResult Function(_SetNewTimestampForConversation value)
        setNewTimestamp,
  }) {
    return onData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
  }) {
    return onData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(this);
    }
    return orElse();
  }
}

abstract class _OnDataReceived implements GroupConversationTimestampsEvent {
  const factory _OnDataReceived(Map<String, DateTime> timestamps) =
      _$_OnDataReceived;

  Map<String, DateTime> get timestamps;
  @JsonKey(ignore: true)
  _$OnDataReceivedCopyWith<_OnDataReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SetNewTimestampForConversationCopyWith<$Res> {
  factory _$SetNewTimestampForConversationCopyWith(
          _SetNewTimestampForConversation value,
          $Res Function(_SetNewTimestampForConversation) then) =
      __$SetNewTimestampForConversationCopyWithImpl<$Res>;
  $Res call({String conversationId, DateTime timestamp});
}

/// @nodoc
class __$SetNewTimestampForConversationCopyWithImpl<$Res>
    extends _$GroupConversationTimestampsEventCopyWithImpl<$Res>
    implements _$SetNewTimestampForConversationCopyWith<$Res> {
  __$SetNewTimestampForConversationCopyWithImpl(
      _SetNewTimestampForConversation _value,
      $Res Function(_SetNewTimestampForConversation) _then)
      : super(_value, (v) => _then(v as _SetNewTimestampForConversation));

  @override
  _SetNewTimestampForConversation get _value =>
      super._value as _SetNewTimestampForConversation;

  @override
  $Res call({
    Object? conversationId = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_SetNewTimestampForConversation(
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_SetNewTimestampForConversation
    implements _SetNewTimestampForConversation {
  const _$_SetNewTimestampForConversation(
      {required this.conversationId, required this.timestamp});

  @override
  final String conversationId;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'GroupConversationTimestampsEvent.setNewTimestamp(conversationId: $conversationId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetNewTimestampForConversation &&
            const DeepCollectionEquality()
                .equals(other.conversationId, conversationId) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversationId),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  _$SetNewTimestampForConversationCopyWith<_SetNewTimestampForConversation>
      get copyWith => __$SetNewTimestampForConversationCopyWithImpl<
          _SetNewTimestampForConversation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) initialize,
    required TResult Function(Map<String, DateTime> timestamps) onData,
    required TResult Function(String conversationId, DateTime timestamp)
        setNewTimestamp,
  }) {
    return setNewTimestamp(conversationId, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
  }) {
    return setNewTimestamp?.call(conversationId, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? initialize,
    TResult Function(Map<String, DateTime> timestamps)? onData,
    TResult Function(String conversationId, DateTime timestamp)?
        setNewTimestamp,
    required TResult orElse(),
  }) {
    if (setNewTimestamp != null) {
      return setNewTimestamp(conversationId, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeTimestamps value) initialize,
    required TResult Function(_OnDataReceived value) onData,
    required TResult Function(_SetNewTimestampForConversation value)
        setNewTimestamp,
  }) {
    return setNewTimestamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
  }) {
    return setNewTimestamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeTimestamps value)? initialize,
    TResult Function(_OnDataReceived value)? onData,
    TResult Function(_SetNewTimestampForConversation value)? setNewTimestamp,
    required TResult orElse(),
  }) {
    if (setNewTimestamp != null) {
      return setNewTimestamp(this);
    }
    return orElse();
  }
}

abstract class _SetNewTimestampForConversation
    implements GroupConversationTimestampsEvent {
  const factory _SetNewTimestampForConversation(
      {required String conversationId,
      required DateTime timestamp}) = _$_SetNewTimestampForConversation;

  String get conversationId;
  DateTime get timestamp;
  @JsonKey(ignore: true)
  _$SetNewTimestampForConversationCopyWith<_SetNewTimestampForConversation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$GroupConversationTimestampsStateTearOff {
  const _$GroupConversationTimestampsStateTearOff();

  _Uninitialized uninitialized() {
    return const _Uninitialized();
  }

  _GroupConversationTimestampsLoaded loaded(
      Map<String, DateTime> timestampMap) {
    return _GroupConversationTimestampsLoaded(
      timestampMap,
    );
  }
}

/// @nodoc
const $GroupConversationTimestampsState =
    _$GroupConversationTimestampsStateTearOff();

/// @nodoc
mixin _$GroupConversationTimestampsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(Map<String, DateTime> timestampMap) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_GroupConversationTimestampsLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupConversationTimestampsStateCopyWith<$Res> {
  factory $GroupConversationTimestampsStateCopyWith(
          GroupConversationTimestampsState value,
          $Res Function(GroupConversationTimestampsState) then) =
      _$GroupConversationTimestampsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GroupConversationTimestampsStateCopyWithImpl<$Res>
    implements $GroupConversationTimestampsStateCopyWith<$Res> {
  _$GroupConversationTimestampsStateCopyWithImpl(this._value, this._then);

  final GroupConversationTimestampsState _value;
  // ignore: unused_field
  final $Res Function(GroupConversationTimestampsState) _then;
}

/// @nodoc
abstract class _$UninitializedCopyWith<$Res> {
  factory _$UninitializedCopyWith(
          _Uninitialized value, $Res Function(_Uninitialized) then) =
      __$UninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UninitializedCopyWithImpl<$Res>
    extends _$GroupConversationTimestampsStateCopyWithImpl<$Res>
    implements _$UninitializedCopyWith<$Res> {
  __$UninitializedCopyWithImpl(
      _Uninitialized _value, $Res Function(_Uninitialized) _then)
      : super(_value, (v) => _then(v as _Uninitialized));

  @override
  _Uninitialized get _value => super._value as _Uninitialized;
}

/// @nodoc

class _$_Uninitialized implements _Uninitialized {
  const _$_Uninitialized();

  @override
  String toString() {
    return 'GroupConversationTimestampsState.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Uninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(Map<String, DateTime> timestampMap) loaded,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_GroupConversationTimestampsLoaded value) loaded,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class _Uninitialized implements GroupConversationTimestampsState {
  const factory _Uninitialized() = _$_Uninitialized;
}

/// @nodoc
abstract class _$GroupConversationTimestampsLoadedCopyWith<$Res> {
  factory _$GroupConversationTimestampsLoadedCopyWith(
          _GroupConversationTimestampsLoaded value,
          $Res Function(_GroupConversationTimestampsLoaded) then) =
      __$GroupConversationTimestampsLoadedCopyWithImpl<$Res>;
  $Res call({Map<String, DateTime> timestampMap});
}

/// @nodoc
class __$GroupConversationTimestampsLoadedCopyWithImpl<$Res>
    extends _$GroupConversationTimestampsStateCopyWithImpl<$Res>
    implements _$GroupConversationTimestampsLoadedCopyWith<$Res> {
  __$GroupConversationTimestampsLoadedCopyWithImpl(
      _GroupConversationTimestampsLoaded _value,
      $Res Function(_GroupConversationTimestampsLoaded) _then)
      : super(_value, (v) => _then(v as _GroupConversationTimestampsLoaded));

  @override
  _GroupConversationTimestampsLoaded get _value =>
      super._value as _GroupConversationTimestampsLoaded;

  @override
  $Res call({
    Object? timestampMap = freezed,
  }) {
    return _then(_GroupConversationTimestampsLoaded(
      timestampMap == freezed
          ? _value.timestampMap
          : timestampMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc

class _$_GroupConversationTimestampsLoaded
    implements _GroupConversationTimestampsLoaded {
  const _$_GroupConversationTimestampsLoaded(this.timestampMap);

  @override
  final Map<String, DateTime> timestampMap;

  @override
  String toString() {
    return 'GroupConversationTimestampsState.loaded(timestampMap: $timestampMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupConversationTimestampsLoaded &&
            const DeepCollectionEquality()
                .equals(other.timestampMap, timestampMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(timestampMap));

  @JsonKey(ignore: true)
  @override
  _$GroupConversationTimestampsLoadedCopyWith<
          _GroupConversationTimestampsLoaded>
      get copyWith => __$GroupConversationTimestampsLoadedCopyWithImpl<
          _GroupConversationTimestampsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(Map<String, DateTime> timestampMap) loaded,
  }) {
    return loaded(timestampMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
  }) {
    return loaded?.call(timestampMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(Map<String, DateTime> timestampMap)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timestampMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_GroupConversationTimestampsLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_GroupConversationTimestampsLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _GroupConversationTimestampsLoaded
    implements GroupConversationTimestampsState {
  const factory _GroupConversationTimestampsLoaded(
          Map<String, DateTime> timestampMap) =
      _$_GroupConversationTimestampsLoaded;

  Map<String, DateTime> get timestampMap;
  @JsonKey(ignore: true)
  _$GroupConversationTimestampsLoadedCopyWith<
          _GroupConversationTimestampsLoaded>
      get copyWith => throw _privateConstructorUsedError;
}
