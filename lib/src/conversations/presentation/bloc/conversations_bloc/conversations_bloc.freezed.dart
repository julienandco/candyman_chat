// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationsStateTearOff {
  const _$ConversationsStateTearOff();

  _Uninitialized uninitialized() {
    return const _Uninitialized();
  }

  _Initialized initialized() {
    return const _Initialized();
  }

  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

  _LoadSuccess loadSuccess(List<ConversationItem> conversations) {
    return _LoadSuccess(
      conversations,
    );
  }

  _LoadFailure loadFailure() {
    return const _LoadFailure();
  }
}

/// @nodoc
const $ConversationsState = _$ConversationsStateTearOff();

/// @nodoc
mixin _$ConversationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsStateCopyWith<$Res> {
  factory $ConversationsStateCopyWith(
          ConversationsState value, $Res Function(ConversationsState) then) =
      _$ConversationsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationsStateCopyWithImpl<$Res>
    implements $ConversationsStateCopyWith<$Res> {
  _$ConversationsStateCopyWithImpl(this._value, this._then);

  final ConversationsState _value;
  // ignore: unused_field
  final $Res Function(ConversationsState) _then;
}

/// @nodoc
abstract class _$UninitializedCopyWith<$Res> {
  factory _$UninitializedCopyWith(
          _Uninitialized value, $Res Function(_Uninitialized) then) =
      __$UninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UninitializedCopyWithImpl<$Res>
    extends _$ConversationsStateCopyWithImpl<$Res>
    implements _$UninitializedCopyWith<$Res> {
  __$UninitializedCopyWithImpl(
      _Uninitialized _value, $Res Function(_Uninitialized) _then)
      : super(_value, (v) => _then(v as _Uninitialized));

  @override
  _Uninitialized get _value => super._value as _Uninitialized;
}

/// @nodoc

class _$_Uninitialized extends _Uninitialized {
  const _$_Uninitialized() : super._();

  @override
  String toString() {
    return 'ConversationsState.uninitialized()';
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
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
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
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class _Uninitialized extends ConversationsState {
  const factory _Uninitialized() = _$_Uninitialized;
  const _Uninitialized._() : super._();
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$ConversationsStateCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;
}

/// @nodoc

class _$_Initialized extends _Initialized {
  const _$_Initialized() : super._();

  @override
  String toString() {
    return 'ConversationsState.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized extends ConversationsState {
  const factory _Initialized() = _$_Initialized;
  const _Initialized._() : super._();
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$ConversationsStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress() : super._();

  @override
  String toString() {
    return 'ConversationsState.loadInProgress()';
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
    required TResult Function() uninitialized,
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
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
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
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

abstract class _LoadInProgress extends ConversationsState {
  const factory _LoadInProgress() = _$_LoadInProgress;
  const _LoadInProgress._() : super._();
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<ConversationItem> conversations});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$ConversationsStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_LoadSuccess(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.conversations) : super._();

  @override
  final List<ConversationItem> conversations;

  @override
  String toString() {
    return 'ConversationsState.loadSuccess(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadSuccess(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadSuccess?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
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

abstract class _LoadSuccess extends ConversationsState {
  const factory _LoadSuccess(List<ConversationItem> conversations) =
      _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  List<ConversationItem> get conversations;
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
    extends _$ConversationsStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure() : super._();

  @override
  String toString() {
    return 'ConversationsState.loadFailure()';
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
    required TResult Function() uninitialized,
    required TResult Function() initialized,
    required TResult Function() loadInProgress,
    required TResult Function(List<ConversationItem> conversations) loadSuccess,
    required TResult Function() loadFailure,
  }) {
    return loadFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
    TResult Function()? loadFailure,
  }) {
    return loadFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? initialized,
    TResult Function()? loadInProgress,
    TResult Function(List<ConversationItem> conversations)? loadSuccess,
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
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(_Initialized value)? initialized,
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

abstract class _LoadFailure extends ConversationsState {
  const factory _LoadFailure() = _$_LoadFailure;
  const _LoadFailure._() : super._();
}

/// @nodoc
class _$ConversationsEventTearOff {
  const _$ConversationsEventTearOff();

  _InitializeMyFirebaseUser initialize({required String myId}) {
    return _InitializeMyFirebaseUser(
      myId: myId,
    );
  }

  _FetchChatItems fetchChatItems(List<Conversation> conversations) {
    return _FetchChatItems(
      conversations,
    );
  }

  _OnChatItemsData onChatItemsData(ConversationItem conversationItem) {
    return _OnChatItemsData(
      conversationItem,
    );
  }

  _OnData onData(List<ConversationItem> conversations) {
    return _OnData(
      conversations,
    );
  }

  _HideConversation hideConversation(String conversationId) {
    return _HideConversation(
      conversationId,
    );
  }

  _CreateConversation createConversation(
      {required FirebaseUser conversationPartner,
      dynamic Function(ConversationItem)? onSuccessfullyCreatedConversation}) {
    return _CreateConversation(
      conversationPartner: conversationPartner,
      onSuccessfullyCreatedConversation: onSuccessfullyCreatedConversation,
    );
  }

  _CreateGroupConversation createGroupConversation(
      {required List<FirebaseUser> conversationPartners,
      dynamic Function(ConversationItem)?
          onSuccessfullyCreatedGroupConversation}) {
    return _CreateGroupConversation(
      conversationPartners: conversationPartners,
      onSuccessfullyCreatedGroupConversation:
          onSuccessfullyCreatedGroupConversation,
    );
  }

  _OnError onError() {
    return const _OnError();
  }

  _Dispose dispose() {
    return const _Dispose();
  }
}

/// @nodoc
const $ConversationsEvent = _$ConversationsEventTearOff();

/// @nodoc
mixin _$ConversationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsEventCopyWith<$Res> {
  factory $ConversationsEventCopyWith(
          ConversationsEvent value, $Res Function(ConversationsEvent) then) =
      _$ConversationsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationsEventCopyWithImpl<$Res>
    implements $ConversationsEventCopyWith<$Res> {
  _$ConversationsEventCopyWithImpl(this._value, this._then);

  final ConversationsEvent _value;
  // ignore: unused_field
  final $Res Function(ConversationsEvent) _then;
}

/// @nodoc
abstract class _$InitializeMyFirebaseUserCopyWith<$Res> {
  factory _$InitializeMyFirebaseUserCopyWith(_InitializeMyFirebaseUser value,
          $Res Function(_InitializeMyFirebaseUser) then) =
      __$InitializeMyFirebaseUserCopyWithImpl<$Res>;
  $Res call({String myId});
}

/// @nodoc
class __$InitializeMyFirebaseUserCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$InitializeMyFirebaseUserCopyWith<$Res> {
  __$InitializeMyFirebaseUserCopyWithImpl(_InitializeMyFirebaseUser _value,
      $Res Function(_InitializeMyFirebaseUser) _then)
      : super(_value, (v) => _then(v as _InitializeMyFirebaseUser));

  @override
  _InitializeMyFirebaseUser get _value =>
      super._value as _InitializeMyFirebaseUser;

  @override
  $Res call({
    Object? myId = freezed,
  }) {
    return _then(_InitializeMyFirebaseUser(
      myId: myId == freezed
          ? _value.myId
          : myId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InitializeMyFirebaseUser implements _InitializeMyFirebaseUser {
  const _$_InitializeMyFirebaseUser({required this.myId});

  @override
  final String myId;

  @override
  String toString() {
    return 'ConversationsEvent.initialize(myId: $myId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitializeMyFirebaseUser &&
            const DeepCollectionEquality().equals(other.myId, myId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myId));

  @JsonKey(ignore: true)
  @override
  _$InitializeMyFirebaseUserCopyWith<_InitializeMyFirebaseUser> get copyWith =>
      __$InitializeMyFirebaseUserCopyWithImpl<_InitializeMyFirebaseUser>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return initialize(myId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return initialize?.call(myId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(myId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _InitializeMyFirebaseUser implements ConversationsEvent {
  const factory _InitializeMyFirebaseUser({required String myId}) =
      _$_InitializeMyFirebaseUser;

  String get myId;
  @JsonKey(ignore: true)
  _$InitializeMyFirebaseUserCopyWith<_InitializeMyFirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchChatItemsCopyWith<$Res> {
  factory _$FetchChatItemsCopyWith(
          _FetchChatItems value, $Res Function(_FetchChatItems) then) =
      __$FetchChatItemsCopyWithImpl<$Res>;
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class __$FetchChatItemsCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$FetchChatItemsCopyWith<$Res> {
  __$FetchChatItemsCopyWithImpl(
      _FetchChatItems _value, $Res Function(_FetchChatItems) _then)
      : super(_value, (v) => _then(v as _FetchChatItems));

  @override
  _FetchChatItems get _value => super._value as _FetchChatItems;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_FetchChatItems(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc

class _$_FetchChatItems implements _FetchChatItems {
  const _$_FetchChatItems(this.conversations);

  @override
  final List<Conversation> conversations;

  @override
  String toString() {
    return 'ConversationsEvent.fetchChatItems(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchChatItems &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$FetchChatItemsCopyWith<_FetchChatItems> get copyWith =>
      __$FetchChatItemsCopyWithImpl<_FetchChatItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return fetchChatItems(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return fetchChatItems?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (fetchChatItems != null) {
      return fetchChatItems(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return fetchChatItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return fetchChatItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (fetchChatItems != null) {
      return fetchChatItems(this);
    }
    return orElse();
  }
}

abstract class _FetchChatItems implements ConversationsEvent {
  const factory _FetchChatItems(List<Conversation> conversations) =
      _$_FetchChatItems;

  List<Conversation> get conversations;
  @JsonKey(ignore: true)
  _$FetchChatItemsCopyWith<_FetchChatItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnChatItemsDataCopyWith<$Res> {
  factory _$OnChatItemsDataCopyWith(
          _OnChatItemsData value, $Res Function(_OnChatItemsData) then) =
      __$OnChatItemsDataCopyWithImpl<$Res>;
  $Res call({ConversationItem conversationItem});

  $ConversationItemCopyWith<$Res> get conversationItem;
}

/// @nodoc
class __$OnChatItemsDataCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$OnChatItemsDataCopyWith<$Res> {
  __$OnChatItemsDataCopyWithImpl(
      _OnChatItemsData _value, $Res Function(_OnChatItemsData) _then)
      : super(_value, (v) => _then(v as _OnChatItemsData));

  @override
  _OnChatItemsData get _value => super._value as _OnChatItemsData;

  @override
  $Res call({
    Object? conversationItem = freezed,
  }) {
    return _then(_OnChatItemsData(
      conversationItem == freezed
          ? _value.conversationItem
          : conversationItem // ignore: cast_nullable_to_non_nullable
              as ConversationItem,
    ));
  }

  @override
  $ConversationItemCopyWith<$Res> get conversationItem {
    return $ConversationItemCopyWith<$Res>(_value.conversationItem, (value) {
      return _then(_value.copyWith(conversationItem: value));
    });
  }
}

/// @nodoc

class _$_OnChatItemsData implements _OnChatItemsData {
  const _$_OnChatItemsData(this.conversationItem);

  @override
  final ConversationItem conversationItem;

  @override
  String toString() {
    return 'ConversationsEvent.onChatItemsData(conversationItem: $conversationItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnChatItemsData &&
            const DeepCollectionEquality()
                .equals(other.conversationItem, conversationItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversationItem));

  @JsonKey(ignore: true)
  @override
  _$OnChatItemsDataCopyWith<_OnChatItemsData> get copyWith =>
      __$OnChatItemsDataCopyWithImpl<_OnChatItemsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return onChatItemsData(conversationItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return onChatItemsData?.call(conversationItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (onChatItemsData != null) {
      return onChatItemsData(conversationItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return onChatItemsData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return onChatItemsData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (onChatItemsData != null) {
      return onChatItemsData(this);
    }
    return orElse();
  }
}

abstract class _OnChatItemsData implements ConversationsEvent {
  const factory _OnChatItemsData(ConversationItem conversationItem) =
      _$_OnChatItemsData;

  ConversationItem get conversationItem;
  @JsonKey(ignore: true)
  _$OnChatItemsDataCopyWith<_OnChatItemsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnDataCopyWith<$Res> {
  factory _$OnDataCopyWith(_OnData value, $Res Function(_OnData) then) =
      __$OnDataCopyWithImpl<$Res>;
  $Res call({List<ConversationItem> conversations});
}

/// @nodoc
class __$OnDataCopyWithImpl<$Res> extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$OnDataCopyWith<$Res> {
  __$OnDataCopyWithImpl(_OnData _value, $Res Function(_OnData) _then)
      : super(_value, (v) => _then(v as _OnData));

  @override
  _OnData get _value => super._value as _OnData;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_OnData(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
    ));
  }
}

/// @nodoc

class _$_OnData implements _OnData {
  const _$_OnData(this.conversations);

  @override
  final List<ConversationItem> conversations;

  @override
  String toString() {
    return 'ConversationsEvent.onData(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnData &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$OnDataCopyWith<_OnData> get copyWith =>
      __$OnDataCopyWithImpl<_OnData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return onData(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return onData?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return onData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return onData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (onData != null) {
      return onData(this);
    }
    return orElse();
  }
}

abstract class _OnData implements ConversationsEvent {
  const factory _OnData(List<ConversationItem> conversations) = _$_OnData;

  List<ConversationItem> get conversations;
  @JsonKey(ignore: true)
  _$OnDataCopyWith<_OnData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HideConversationCopyWith<$Res> {
  factory _$HideConversationCopyWith(
          _HideConversation value, $Res Function(_HideConversation) then) =
      __$HideConversationCopyWithImpl<$Res>;
  $Res call({String conversationId});
}

/// @nodoc
class __$HideConversationCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$HideConversationCopyWith<$Res> {
  __$HideConversationCopyWithImpl(
      _HideConversation _value, $Res Function(_HideConversation) _then)
      : super(_value, (v) => _then(v as _HideConversation));

  @override
  _HideConversation get _value => super._value as _HideConversation;

  @override
  $Res call({
    Object? conversationId = freezed,
  }) {
    return _then(_HideConversation(
      conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HideConversation implements _HideConversation {
  const _$_HideConversation(this.conversationId);

  @override
  final String conversationId;

  @override
  String toString() {
    return 'ConversationsEvent.hideConversation(conversationId: $conversationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HideConversation &&
            const DeepCollectionEquality()
                .equals(other.conversationId, conversationId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversationId));

  @JsonKey(ignore: true)
  @override
  _$HideConversationCopyWith<_HideConversation> get copyWith =>
      __$HideConversationCopyWithImpl<_HideConversation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return hideConversation(conversationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return hideConversation?.call(conversationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (hideConversation != null) {
      return hideConversation(conversationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return hideConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return hideConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (hideConversation != null) {
      return hideConversation(this);
    }
    return orElse();
  }
}

abstract class _HideConversation implements ConversationsEvent {
  const factory _HideConversation(String conversationId) = _$_HideConversation;

  String get conversationId;
  @JsonKey(ignore: true)
  _$HideConversationCopyWith<_HideConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateConversationCopyWith<$Res> {
  factory _$CreateConversationCopyWith(
          _CreateConversation value, $Res Function(_CreateConversation) then) =
      __$CreateConversationCopyWithImpl<$Res>;
  $Res call(
      {FirebaseUser conversationPartner,
      dynamic Function(ConversationItem)? onSuccessfullyCreatedConversation});

  $FirebaseUserCopyWith<$Res> get conversationPartner;
}

/// @nodoc
class __$CreateConversationCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$CreateConversationCopyWith<$Res> {
  __$CreateConversationCopyWithImpl(
      _CreateConversation _value, $Res Function(_CreateConversation) _then)
      : super(_value, (v) => _then(v as _CreateConversation));

  @override
  _CreateConversation get _value => super._value as _CreateConversation;

  @override
  $Res call({
    Object? conversationPartner = freezed,
    Object? onSuccessfullyCreatedConversation = freezed,
  }) {
    return _then(_CreateConversation(
      conversationPartner: conversationPartner == freezed
          ? _value.conversationPartner
          : conversationPartner // ignore: cast_nullable_to_non_nullable
              as FirebaseUser,
      onSuccessfullyCreatedConversation: onSuccessfullyCreatedConversation ==
              freezed
          ? _value.onSuccessfullyCreatedConversation
          : onSuccessfullyCreatedConversation // ignore: cast_nullable_to_non_nullable
              as dynamic Function(ConversationItem)?,
    ));
  }

  @override
  $FirebaseUserCopyWith<$Res> get conversationPartner {
    return $FirebaseUserCopyWith<$Res>(_value.conversationPartner, (value) {
      return _then(_value.copyWith(conversationPartner: value));
    });
  }
}

/// @nodoc

class _$_CreateConversation implements _CreateConversation {
  const _$_CreateConversation(
      {required this.conversationPartner,
      this.onSuccessfullyCreatedConversation});

  @override
  final FirebaseUser conversationPartner;
  @override
  final dynamic Function(ConversationItem)? onSuccessfullyCreatedConversation;

  @override
  String toString() {
    return 'ConversationsEvent.createConversation(conversationPartner: $conversationPartner, onSuccessfullyCreatedConversation: $onSuccessfullyCreatedConversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateConversation &&
            const DeepCollectionEquality()
                .equals(other.conversationPartner, conversationPartner) &&
            (identical(other.onSuccessfullyCreatedConversation,
                    onSuccessfullyCreatedConversation) ||
                other.onSuccessfullyCreatedConversation ==
                    onSuccessfullyCreatedConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversationPartner),
      onSuccessfullyCreatedConversation);

  @JsonKey(ignore: true)
  @override
  _$CreateConversationCopyWith<_CreateConversation> get copyWith =>
      __$CreateConversationCopyWithImpl<_CreateConversation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return createConversation(
        conversationPartner, onSuccessfullyCreatedConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return createConversation?.call(
        conversationPartner, onSuccessfullyCreatedConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (createConversation != null) {
      return createConversation(
          conversationPartner, onSuccessfullyCreatedConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return createConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return createConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (createConversation != null) {
      return createConversation(this);
    }
    return orElse();
  }
}

abstract class _CreateConversation implements ConversationsEvent {
  const factory _CreateConversation(
      {required FirebaseUser conversationPartner,
      dynamic Function(ConversationItem)?
          onSuccessfullyCreatedConversation}) = _$_CreateConversation;

  FirebaseUser get conversationPartner;
  dynamic Function(ConversationItem)? get onSuccessfullyCreatedConversation;
  @JsonKey(ignore: true)
  _$CreateConversationCopyWith<_CreateConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateGroupConversationCopyWith<$Res> {
  factory _$CreateGroupConversationCopyWith(_CreateGroupConversation value,
          $Res Function(_CreateGroupConversation) then) =
      __$CreateGroupConversationCopyWithImpl<$Res>;
  $Res call(
      {List<FirebaseUser> conversationPartners,
      dynamic Function(ConversationItem)?
          onSuccessfullyCreatedGroupConversation});
}

/// @nodoc
class __$CreateGroupConversationCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$CreateGroupConversationCopyWith<$Res> {
  __$CreateGroupConversationCopyWithImpl(_CreateGroupConversation _value,
      $Res Function(_CreateGroupConversation) _then)
      : super(_value, (v) => _then(v as _CreateGroupConversation));

  @override
  _CreateGroupConversation get _value =>
      super._value as _CreateGroupConversation;

  @override
  $Res call({
    Object? conversationPartners = freezed,
    Object? onSuccessfullyCreatedGroupConversation = freezed,
  }) {
    return _then(_CreateGroupConversation(
      conversationPartners: conversationPartners == freezed
          ? _value.conversationPartners
          : conversationPartners // ignore: cast_nullable_to_non_nullable
              as List<FirebaseUser>,
      onSuccessfullyCreatedGroupConversation:
          onSuccessfullyCreatedGroupConversation == freezed
              ? _value.onSuccessfullyCreatedGroupConversation
              : onSuccessfullyCreatedGroupConversation // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(ConversationItem)?,
    ));
  }
}

/// @nodoc

class _$_CreateGroupConversation implements _CreateGroupConversation {
  const _$_CreateGroupConversation(
      {required this.conversationPartners,
      this.onSuccessfullyCreatedGroupConversation});

  @override
  final List<FirebaseUser> conversationPartners;
  @override
  final dynamic Function(ConversationItem)?
      onSuccessfullyCreatedGroupConversation;

  @override
  String toString() {
    return 'ConversationsEvent.createGroupConversation(conversationPartners: $conversationPartners, onSuccessfullyCreatedGroupConversation: $onSuccessfullyCreatedGroupConversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateGroupConversation &&
            const DeepCollectionEquality()
                .equals(other.conversationPartners, conversationPartners) &&
            (identical(other.onSuccessfullyCreatedGroupConversation,
                    onSuccessfullyCreatedGroupConversation) ||
                other.onSuccessfullyCreatedGroupConversation ==
                    onSuccessfullyCreatedGroupConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversationPartners),
      onSuccessfullyCreatedGroupConversation);

  @JsonKey(ignore: true)
  @override
  _$CreateGroupConversationCopyWith<_CreateGroupConversation> get copyWith =>
      __$CreateGroupConversationCopyWithImpl<_CreateGroupConversation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return createGroupConversation(
        conversationPartners, onSuccessfullyCreatedGroupConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return createGroupConversation?.call(
        conversationPartners, onSuccessfullyCreatedGroupConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (createGroupConversation != null) {
      return createGroupConversation(
          conversationPartners, onSuccessfullyCreatedGroupConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return createGroupConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return createGroupConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (createGroupConversation != null) {
      return createGroupConversation(this);
    }
    return orElse();
  }
}

abstract class _CreateGroupConversation implements ConversationsEvent {
  const factory _CreateGroupConversation(
      {required List<FirebaseUser> conversationPartners,
      dynamic Function(ConversationItem)?
          onSuccessfullyCreatedGroupConversation}) = _$_CreateGroupConversation;

  List<FirebaseUser> get conversationPartners;
  dynamic Function(ConversationItem)?
      get onSuccessfullyCreatedGroupConversation;
  @JsonKey(ignore: true)
  _$CreateGroupConversationCopyWith<_CreateGroupConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnErrorCopyWith<$Res> {
  factory _$OnErrorCopyWith(_OnError value, $Res Function(_OnError) then) =
      __$OnErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnErrorCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$OnErrorCopyWith<$Res> {
  __$OnErrorCopyWithImpl(_OnError _value, $Res Function(_OnError) _then)
      : super(_value, (v) => _then(v as _OnError));

  @override
  _OnError get _value => super._value as _OnError;
}

/// @nodoc

class _$_OnError implements _OnError {
  const _$_OnError();

  @override
  String toString() {
    return 'ConversationsEvent.onError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return onError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return onError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class _OnError implements ConversationsEvent {
  const factory _OnError() = _$_OnError;
}

/// @nodoc
abstract class _$DisposeCopyWith<$Res> {
  factory _$DisposeCopyWith(_Dispose value, $Res Function(_Dispose) then) =
      __$DisposeCopyWithImpl<$Res>;
}

/// @nodoc
class __$DisposeCopyWithImpl<$Res>
    extends _$ConversationsEventCopyWithImpl<$Res>
    implements _$DisposeCopyWith<$Res> {
  __$DisposeCopyWithImpl(_Dispose _value, $Res Function(_Dispose) _then)
      : super(_value, (v) => _then(v as _Dispose));

  @override
  _Dispose get _value => super._value as _Dispose;
}

/// @nodoc

class _$_Dispose implements _Dispose {
  const _$_Dispose();

  @override
  String toString() {
    return 'ConversationsEvent.dispose()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Dispose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String myId) initialize,
    required TResult Function(List<Conversation> conversations) fetchChatItems,
    required TResult Function(ConversationItem conversationItem)
        onChatItemsData,
    required TResult Function(List<ConversationItem> conversations) onData,
    required TResult Function(String conversationId) hideConversation,
    required TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)
        createConversation,
    required TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)
        createGroupConversation,
    required TResult Function() onError,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String myId)? initialize,
    TResult Function(List<Conversation> conversations)? fetchChatItems,
    TResult Function(ConversationItem conversationItem)? onChatItemsData,
    TResult Function(List<ConversationItem> conversations)? onData,
    TResult Function(String conversationId)? hideConversation,
    TResult Function(
            FirebaseUser conversationPartner,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedConversation)?
        createConversation,
    TResult Function(
            List<FirebaseUser> conversationPartners,
            dynamic Function(ConversationItem)?
                onSuccessfullyCreatedGroupConversation)?
        createGroupConversation,
    TResult Function()? onError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeMyFirebaseUser value) initialize,
    required TResult Function(_FetchChatItems value) fetchChatItems,
    required TResult Function(_OnChatItemsData value) onChatItemsData,
    required TResult Function(_OnData value) onData,
    required TResult Function(_HideConversation value) hideConversation,
    required TResult Function(_CreateConversation value) createConversation,
    required TResult Function(_CreateGroupConversation value)
        createGroupConversation,
    required TResult Function(_OnError value) onError,
    required TResult Function(_Dispose value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeMyFirebaseUser value)? initialize,
    TResult Function(_FetchChatItems value)? fetchChatItems,
    TResult Function(_OnChatItemsData value)? onChatItemsData,
    TResult Function(_OnData value)? onData,
    TResult Function(_HideConversation value)? hideConversation,
    TResult Function(_CreateConversation value)? createConversation,
    TResult Function(_CreateGroupConversation value)? createGroupConversation,
    TResult Function(_OnError value)? onError,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class _Dispose implements ConversationsEvent {
  const factory _Dispose() = _$_Dispose;
}
