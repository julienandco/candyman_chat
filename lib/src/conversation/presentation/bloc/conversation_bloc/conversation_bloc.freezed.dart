// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationStateTearOff {
  const _$ConversationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

  _LoadSuccess loadSuccess(
      {required List<ConversationMessage> messages,
      required Conversation conversation}) {
    return _LoadSuccess(
      messages: messages,
      conversation: conversation,
    );
  }

  _LoadFailure loadFailure() {
    return const _LoadFailure();
  }
}

/// @nodoc
const $ConversationState = _$ConversationStateTearOff();

/// @nodoc
mixin _$ConversationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        loadSuccess,
    required TResult Function() loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationStateCopyWith<$Res> {
  factory $ConversationStateCopyWith(
          ConversationState value, $Res Function(ConversationState) then) =
      _$ConversationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationStateCopyWithImpl<$Res>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._value, this._then);

  final ConversationState _value;
  // ignore: unused_field
  final $Res Function(ConversationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ConversationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial extends _Initial with DiagnosticableTreeMixin {
  const _$_Initial() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ConversationState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends ConversationState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress with DiagnosticableTreeMixin {
  const _$_LoadInProgress() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationState.loadInProgress()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ConversationState.loadInProgress'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends ConversationState {
  const factory _LoadInProgress() = _$_LoadInProgress;
  const _LoadInProgress._() : super._();
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<ConversationMessage> messages, Conversation conversation});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? messages = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_LoadSuccess(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ConversationMessage>,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess with DiagnosticableTreeMixin {
  const _$_LoadSuccess({required this.messages, required this.conversation})
      : super._();

  @override
  final List<ConversationMessage> messages;
  @override
  final Conversation conversation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationState.loadSuccess(messages: $messages, conversation: $conversation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationState.loadSuccess'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('conversation', conversation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(conversation));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadSuccess(messages, conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadSuccess?.call(messages, conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(messages, conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends ConversationState {
  const factory _LoadSuccess(
      {required List<ConversationMessage> messages,
      required Conversation conversation}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  List<ConversationMessage> get messages;
  Conversation get conversation;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure with DiagnosticableTreeMixin {
  const _$_LoadFailure() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationState.loadFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ConversationState.loadFailure'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends ConversationState {
  const factory _LoadFailure() = _$_LoadFailure;
  const _LoadFailure._() : super._();
}

/// @nodoc
class _$ConversationEventTearOff {
  const _$ConversationEventTearOff();

  _OnData onData(
      List<ConversationMessage> messages, Conversation conversation) {
    return _OnData(
      messages,
      conversation,
    );
  }

  _SendTextMessage sendTextMessage(String message) {
    return _SendTextMessage(
      message,
    );
  }

  _SendImageMessage sendImageMessage(String message) {
    return _SendImageMessage(
      message,
    );
  }

  _SendVoiceMessage sendVoiceMessage(String message, Duration duration) {
    return _SendVoiceMessage(
      message,
      duration,
    );
  }

  _SendVideoMessage sendVideoMessage(String message) {
    return _SendVideoMessage(
      message,
    );
  }

  _SendMultipleFiles sendMultipleFiles(List<AssetEntity> files) {
    return _SendMultipleFiles(
      files,
    );
  }

  _SendFileMessage sendFileMessage(PlatformFile file) {
    return _SendFileMessage(
      file,
    );
  }

  _MarkAsSeen markAsSeen(ConversationMessage message) {
    return _MarkAsSeen(
      message,
    );
  }

  _DeleteMessage deleteMessage(ConversationMessage message) {
    return _DeleteMessage(
      message,
    );
  }

  _HideMessage hideMessage(ConversationMessage message) {
    return _HideMessage(
      message,
    );
  }
}

/// @nodoc
const $ConversationEvent = _$ConversationEventTearOff();

/// @nodoc
mixin _$ConversationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationEventCopyWith<$Res> {
  factory $ConversationEventCopyWith(
          ConversationEvent value, $Res Function(ConversationEvent) then) =
      _$ConversationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationEventCopyWithImpl<$Res>
    implements $ConversationEventCopyWith<$Res> {
  _$ConversationEventCopyWithImpl(this._value, this._then);

  final ConversationEvent _value;
  // ignore: unused_field
  final $Res Function(ConversationEvent) _then;
}

/// @nodoc
abstract class _$OnDataCopyWith<$Res> {
  factory _$OnDataCopyWith(_OnData value, $Res Function(_OnData) then) =
      __$OnDataCopyWithImpl<$Res>;
  $Res call({List<ConversationMessage> messages, Conversation conversation});
}

/// @nodoc
class __$OnDataCopyWithImpl<$Res> extends _$ConversationEventCopyWithImpl<$Res>
    implements _$OnDataCopyWith<$Res> {
  __$OnDataCopyWithImpl(_OnData _value, $Res Function(_OnData) _then)
      : super(_value, (v) => _then(v as _OnData));

  @override
  _OnData get _value => super._value as _OnData;

  @override
  $Res call({
    Object? messages = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_OnData(
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ConversationMessage>,
      conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
    ));
  }
}

/// @nodoc

class _$_OnData with DiagnosticableTreeMixin implements _OnData {
  const _$_OnData(this.messages, this.conversation);

  @override
  final List<ConversationMessage> messages;
  @override
  final Conversation conversation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.onData(messages: $messages, conversation: $conversation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.onData'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('conversation', conversation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnData &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(conversation));

  @JsonKey(ignore: true)
  @override
  _$OnDataCopyWith<_OnData> get copyWith =>
      __$OnDataCopyWithImpl<_OnData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return onData(messages, conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return onData?.call(messages, conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(messages, conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return onData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return onData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(this);
    }
    return orElse();
  }
}

abstract class _OnData implements ConversationEvent {
  const factory _OnData(
          List<ConversationMessage> messages, Conversation conversation) =
      _$_OnData;

  List<ConversationMessage> get messages;
  Conversation get conversation;
  @JsonKey(ignore: true)
  _$OnDataCopyWith<_OnData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendTextMessageCopyWith<$Res> {
  factory _$SendTextMessageCopyWith(
          _SendTextMessage value, $Res Function(_SendTextMessage) then) =
      __$SendTextMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SendTextMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendTextMessageCopyWith<$Res> {
  __$SendTextMessageCopyWithImpl(
      _SendTextMessage _value, $Res Function(_SendTextMessage) _then)
      : super(_value, (v) => _then(v as _SendTextMessage));

  @override
  _SendTextMessage get _value => super._value as _SendTextMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SendTextMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendTextMessage
    with DiagnosticableTreeMixin
    implements _SendTextMessage {
  const _$_SendTextMessage(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendTextMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendTextMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendTextMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SendTextMessageCopyWith<_SendTextMessage> get copyWith =>
      __$SendTextMessageCopyWithImpl<_SendTextMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendTextMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendTextMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendTextMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendTextMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(this);
    }
    return orElse();
  }
}

abstract class _SendTextMessage implements ConversationEvent {
  const factory _SendTextMessage(String message) = _$_SendTextMessage;

  String get message;
  @JsonKey(ignore: true)
  _$SendTextMessageCopyWith<_SendTextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendImageMessageCopyWith<$Res> {
  factory _$SendImageMessageCopyWith(
          _SendImageMessage value, $Res Function(_SendImageMessage) then) =
      __$SendImageMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SendImageMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendImageMessageCopyWith<$Res> {
  __$SendImageMessageCopyWithImpl(
      _SendImageMessage _value, $Res Function(_SendImageMessage) _then)
      : super(_value, (v) => _then(v as _SendImageMessage));

  @override
  _SendImageMessage get _value => super._value as _SendImageMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SendImageMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendImageMessage
    with DiagnosticableTreeMixin
    implements _SendImageMessage {
  const _$_SendImageMessage(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendImageMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendImageMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendImageMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SendImageMessageCopyWith<_SendImageMessage> get copyWith =>
      __$SendImageMessageCopyWithImpl<_SendImageMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendImageMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendImageMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendImageMessage != null) {
      return sendImageMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendImageMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendImageMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendImageMessage != null) {
      return sendImageMessage(this);
    }
    return orElse();
  }
}

abstract class _SendImageMessage implements ConversationEvent {
  const factory _SendImageMessage(String message) = _$_SendImageMessage;

  String get message;
  @JsonKey(ignore: true)
  _$SendImageMessageCopyWith<_SendImageMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendVoiceMessageCopyWith<$Res> {
  factory _$SendVoiceMessageCopyWith(
          _SendVoiceMessage value, $Res Function(_SendVoiceMessage) then) =
      __$SendVoiceMessageCopyWithImpl<$Res>;
  $Res call({String message, Duration duration});
}

/// @nodoc
class __$SendVoiceMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendVoiceMessageCopyWith<$Res> {
  __$SendVoiceMessageCopyWithImpl(
      _SendVoiceMessage _value, $Res Function(_SendVoiceMessage) _then)
      : super(_value, (v) => _then(v as _SendVoiceMessage));

  @override
  _SendVoiceMessage get _value => super._value as _SendVoiceMessage;

  @override
  $Res call({
    Object? message = freezed,
    Object? duration = freezed,
  }) {
    return _then(_SendVoiceMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_SendVoiceMessage
    with DiagnosticableTreeMixin
    implements _SendVoiceMessage {
  const _$_SendVoiceMessage(this.message, this.duration);

  @override
  final String message;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendVoiceMessage(message: $message, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendVoiceMessage'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendVoiceMessage &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$SendVoiceMessageCopyWith<_SendVoiceMessage> get copyWith =>
      __$SendVoiceMessageCopyWithImpl<_SendVoiceMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendVoiceMessage(message, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendVoiceMessage?.call(message, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendVoiceMessage != null) {
      return sendVoiceMessage(message, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendVoiceMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendVoiceMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendVoiceMessage != null) {
      return sendVoiceMessage(this);
    }
    return orElse();
  }
}

abstract class _SendVoiceMessage implements ConversationEvent {
  const factory _SendVoiceMessage(String message, Duration duration) =
      _$_SendVoiceMessage;

  String get message;
  Duration get duration;
  @JsonKey(ignore: true)
  _$SendVoiceMessageCopyWith<_SendVoiceMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendVideoMessageCopyWith<$Res> {
  factory _$SendVideoMessageCopyWith(
          _SendVideoMessage value, $Res Function(_SendVideoMessage) then) =
      __$SendVideoMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SendVideoMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendVideoMessageCopyWith<$Res> {
  __$SendVideoMessageCopyWithImpl(
      _SendVideoMessage _value, $Res Function(_SendVideoMessage) _then)
      : super(_value, (v) => _then(v as _SendVideoMessage));

  @override
  _SendVideoMessage get _value => super._value as _SendVideoMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SendVideoMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendVideoMessage
    with DiagnosticableTreeMixin
    implements _SendVideoMessage {
  const _$_SendVideoMessage(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendVideoMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendVideoMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendVideoMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SendVideoMessageCopyWith<_SendVideoMessage> get copyWith =>
      __$SendVideoMessageCopyWithImpl<_SendVideoMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendVideoMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendVideoMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendVideoMessage != null) {
      return sendVideoMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendVideoMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendVideoMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendVideoMessage != null) {
      return sendVideoMessage(this);
    }
    return orElse();
  }
}

abstract class _SendVideoMessage implements ConversationEvent {
  const factory _SendVideoMessage(String message) = _$_SendVideoMessage;

  String get message;
  @JsonKey(ignore: true)
  _$SendVideoMessageCopyWith<_SendVideoMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendMultipleFilesCopyWith<$Res> {
  factory _$SendMultipleFilesCopyWith(
          _SendMultipleFiles value, $Res Function(_SendMultipleFiles) then) =
      __$SendMultipleFilesCopyWithImpl<$Res>;
  $Res call({List<AssetEntity> files});
}

/// @nodoc
class __$SendMultipleFilesCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendMultipleFilesCopyWith<$Res> {
  __$SendMultipleFilesCopyWithImpl(
      _SendMultipleFiles _value, $Res Function(_SendMultipleFiles) _then)
      : super(_value, (v) => _then(v as _SendMultipleFiles));

  @override
  _SendMultipleFiles get _value => super._value as _SendMultipleFiles;

  @override
  $Res call({
    Object? files = freezed,
  }) {
    return _then(_SendMultipleFiles(
      files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
    ));
  }
}

/// @nodoc

class _$_SendMultipleFiles
    with DiagnosticableTreeMixin
    implements _SendMultipleFiles {
  const _$_SendMultipleFiles(this.files);

  @override
  final List<AssetEntity> files;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendMultipleFiles(files: $files)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendMultipleFiles'))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendMultipleFiles &&
            const DeepCollectionEquality().equals(other.files, files));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(files));

  @JsonKey(ignore: true)
  @override
  _$SendMultipleFilesCopyWith<_SendMultipleFiles> get copyWith =>
      __$SendMultipleFilesCopyWithImpl<_SendMultipleFiles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendMultipleFiles(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendMultipleFiles?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendMultipleFiles != null) {
      return sendMultipleFiles(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendMultipleFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendMultipleFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendMultipleFiles != null) {
      return sendMultipleFiles(this);
    }
    return orElse();
  }
}

abstract class _SendMultipleFiles implements ConversationEvent {
  const factory _SendMultipleFiles(List<AssetEntity> files) =
      _$_SendMultipleFiles;

  List<AssetEntity> get files;
  @JsonKey(ignore: true)
  _$SendMultipleFilesCopyWith<_SendMultipleFiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendFileMessageCopyWith<$Res> {
  factory _$SendFileMessageCopyWith(
          _SendFileMessage value, $Res Function(_SendFileMessage) then) =
      __$SendFileMessageCopyWithImpl<$Res>;
  $Res call({PlatformFile file});
}

/// @nodoc
class __$SendFileMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$SendFileMessageCopyWith<$Res> {
  __$SendFileMessageCopyWithImpl(
      _SendFileMessage _value, $Res Function(_SendFileMessage) _then)
      : super(_value, (v) => _then(v as _SendFileMessage));

  @override
  _SendFileMessage get _value => super._value as _SendFileMessage;

  @override
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_SendFileMessage(
      file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$_SendFileMessage
    with DiagnosticableTreeMixin
    implements _SendFileMessage {
  const _$_SendFileMessage(this.file);

  @override
  final PlatformFile file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.sendFileMessage(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.sendFileMessage'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendFileMessage &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$SendFileMessageCopyWith<_SendFileMessage> get copyWith =>
      __$SendFileMessageCopyWithImpl<_SendFileMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return sendFileMessage(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return sendFileMessage?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendFileMessage != null) {
      return sendFileMessage(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return sendFileMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return sendFileMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (sendFileMessage != null) {
      return sendFileMessage(this);
    }
    return orElse();
  }
}

abstract class _SendFileMessage implements ConversationEvent {
  const factory _SendFileMessage(PlatformFile file) = _$_SendFileMessage;

  PlatformFile get file;
  @JsonKey(ignore: true)
  _$SendFileMessageCopyWith<_SendFileMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MarkAsSeenCopyWith<$Res> {
  factory _$MarkAsSeenCopyWith(
          _MarkAsSeen value, $Res Function(_MarkAsSeen) then) =
      __$MarkAsSeenCopyWithImpl<$Res>;
  $Res call({ConversationMessage message});

  $ConversationMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$MarkAsSeenCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$MarkAsSeenCopyWith<$Res> {
  __$MarkAsSeenCopyWithImpl(
      _MarkAsSeen _value, $Res Function(_MarkAsSeen) _then)
      : super(_value, (v) => _then(v as _MarkAsSeen));

  @override
  _MarkAsSeen get _value => super._value as _MarkAsSeen;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_MarkAsSeen(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ConversationMessage,
    ));
  }

  @override
  $ConversationMessageCopyWith<$Res> get message {
    return $ConversationMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$_MarkAsSeen with DiagnosticableTreeMixin implements _MarkAsSeen {
  const _$_MarkAsSeen(this.message);

  @override
  final ConversationMessage message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.markAsSeen(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.markAsSeen'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarkAsSeen &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$MarkAsSeenCopyWith<_MarkAsSeen> get copyWith =>
      __$MarkAsSeenCopyWithImpl<_MarkAsSeen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return markAsSeen(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return markAsSeen?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (markAsSeen != null) {
      return markAsSeen(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return markAsSeen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return markAsSeen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (markAsSeen != null) {
      return markAsSeen(this);
    }
    return orElse();
  }
}

abstract class _MarkAsSeen implements ConversationEvent {
  const factory _MarkAsSeen(ConversationMessage message) = _$_MarkAsSeen;

  ConversationMessage get message;
  @JsonKey(ignore: true)
  _$MarkAsSeenCopyWith<_MarkAsSeen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteMessageCopyWith<$Res> {
  factory _$DeleteMessageCopyWith(
          _DeleteMessage value, $Res Function(_DeleteMessage) then) =
      __$DeleteMessageCopyWithImpl<$Res>;
  $Res call({ConversationMessage message});

  $ConversationMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$DeleteMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$DeleteMessageCopyWith<$Res> {
  __$DeleteMessageCopyWithImpl(
      _DeleteMessage _value, $Res Function(_DeleteMessage) _then)
      : super(_value, (v) => _then(v as _DeleteMessage));

  @override
  _DeleteMessage get _value => super._value as _DeleteMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_DeleteMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ConversationMessage,
    ));
  }

  @override
  $ConversationMessageCopyWith<$Res> get message {
    return $ConversationMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$_DeleteMessage with DiagnosticableTreeMixin implements _DeleteMessage {
  const _$_DeleteMessage(this.message);

  @override
  final ConversationMessage message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.deleteMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.deleteMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$DeleteMessageCopyWith<_DeleteMessage> get copyWith =>
      __$DeleteMessageCopyWithImpl<_DeleteMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return deleteMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return deleteMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return deleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return deleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessage implements ConversationEvent {
  const factory _DeleteMessage(ConversationMessage message) = _$_DeleteMessage;

  ConversationMessage get message;
  @JsonKey(ignore: true)
  _$DeleteMessageCopyWith<_DeleteMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HideMessageCopyWith<$Res> {
  factory _$HideMessageCopyWith(
          _HideMessage value, $Res Function(_HideMessage) then) =
      __$HideMessageCopyWithImpl<$Res>;
  $Res call({ConversationMessage message});

  $ConversationMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$HideMessageCopyWithImpl<$Res>
    extends _$ConversationEventCopyWithImpl<$Res>
    implements _$HideMessageCopyWith<$Res> {
  __$HideMessageCopyWithImpl(
      _HideMessage _value, $Res Function(_HideMessage) _then)
      : super(_value, (v) => _then(v as _HideMessage));

  @override
  _HideMessage get _value => super._value as _HideMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_HideMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ConversationMessage,
    ));
  }

  @override
  $ConversationMessageCopyWith<$Res> get message {
    return $ConversationMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$_HideMessage with DiagnosticableTreeMixin implements _HideMessage {
  const _$_HideMessage(this.message);

  @override
  final ConversationMessage message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationEvent.hideMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationEvent.hideMessage'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HideMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$HideMessageCopyWith<_HideMessage> get copyWith =>
      __$HideMessageCopyWithImpl<_HideMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationMessage> messages, Conversation conversation)
        onData,
    required TResult Function(String message) sendTextMessage,
    required TResult Function(String message) sendImageMessage,
    required TResult Function(String message, Duration duration)
        sendVoiceMessage,
    required TResult Function(String message) sendVideoMessage,
    required TResult Function(List<AssetEntity> files) sendMultipleFiles,
    required TResult Function(PlatformFile file) sendFileMessage,
    required TResult Function(ConversationMessage message) markAsSeen,
    required TResult Function(ConversationMessage message) deleteMessage,
    required TResult Function(ConversationMessage message) hideMessage,
  }) {
    return hideMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
  }) {
    return hideMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ConversationMessage> messages, Conversation conversation)?
        onData,
    TResult Function(String message)? sendTextMessage,
    TResult Function(String message)? sendImageMessage,
    TResult Function(String message, Duration duration)? sendVoiceMessage,
    TResult Function(String message)? sendVideoMessage,
    TResult Function(List<AssetEntity> files)? sendMultipleFiles,
    TResult Function(PlatformFile file)? sendFileMessage,
    TResult Function(ConversationMessage message)? markAsSeen,
    TResult Function(ConversationMessage message)? deleteMessage,
    TResult Function(ConversationMessage message)? hideMessage,
    required TResult orElse(),
  }) {
    if (hideMessage != null) {
      return hideMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnData value) onData,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_SendImageMessage value) sendImageMessage,
    required TResult Function(_SendVoiceMessage value) sendVoiceMessage,
    required TResult Function(_SendVideoMessage value) sendVideoMessage,
    required TResult Function(_SendMultipleFiles value) sendMultipleFiles,
    required TResult Function(_SendFileMessage value) sendFileMessage,
    required TResult Function(_MarkAsSeen value) markAsSeen,
    required TResult Function(_DeleteMessage value) deleteMessage,
    required TResult Function(_HideMessage value) hideMessage,
  }) {
    return hideMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
  }) {
    return hideMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnData value)? onData,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_SendImageMessage value)? sendImageMessage,
    TResult Function(_SendVoiceMessage value)? sendVoiceMessage,
    TResult Function(_SendVideoMessage value)? sendVideoMessage,
    TResult Function(_SendMultipleFiles value)? sendMultipleFiles,
    TResult Function(_SendFileMessage value)? sendFileMessage,
    TResult Function(_MarkAsSeen value)? markAsSeen,
    TResult Function(_DeleteMessage value)? deleteMessage,
    TResult Function(_HideMessage value)? hideMessage,
    required TResult orElse(),
  }) {
    if (hideMessage != null) {
      return hideMessage(this);
    }
    return orElse();
  }
}

abstract class _HideMessage implements ConversationEvent {
  const factory _HideMessage(ConversationMessage message) = _$_HideMessage;

  ConversationMessage get message;
  @JsonKey(ignore: true)
  _$HideMessageCopyWith<_HideMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
