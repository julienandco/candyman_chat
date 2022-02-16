// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversations_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationsSearchEventTearOff {
  const _$ConversationsSearchEventTearOff();

  _SetEntries setEntries(List<ConversationItem> conversations) {
    return _SetEntries(
      conversations,
    );
  }

  _SearchSwitch searchSwitch(bool isActive) {
    return _SearchSwitch(
      isActive,
    );
  }

  _Query query(String searchString) {
    return _Query(
      searchString,
    );
  }

  _OnResult onResult(List<ConversationItem> conversations) {
    return _OnResult(
      conversations,
    );
  }
}

/// @nodoc
const $ConversationsSearchEvent = _$ConversationsSearchEventTearOff();

/// @nodoc
mixin _$ConversationsSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationItem> conversations) setEntries,
    required TResult Function(bool isActive) searchSwitch,
    required TResult Function(String searchString) query,
    required TResult Function(List<ConversationItem> conversations) onResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsSearchEventCopyWith<$Res> {
  factory $ConversationsSearchEventCopyWith(ConversationsSearchEvent value,
          $Res Function(ConversationsSearchEvent) then) =
      _$ConversationsSearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationsSearchEventCopyWithImpl<$Res>
    implements $ConversationsSearchEventCopyWith<$Res> {
  _$ConversationsSearchEventCopyWithImpl(this._value, this._then);

  final ConversationsSearchEvent _value;
  // ignore: unused_field
  final $Res Function(ConversationsSearchEvent) _then;
}

/// @nodoc
abstract class _$SetEntriesCopyWith<$Res> {
  factory _$SetEntriesCopyWith(
          _SetEntries value, $Res Function(_SetEntries) then) =
      __$SetEntriesCopyWithImpl<$Res>;
  $Res call({List<ConversationItem> conversations});
}

/// @nodoc
class __$SetEntriesCopyWithImpl<$Res>
    extends _$ConversationsSearchEventCopyWithImpl<$Res>
    implements _$SetEntriesCopyWith<$Res> {
  __$SetEntriesCopyWithImpl(
      _SetEntries _value, $Res Function(_SetEntries) _then)
      : super(_value, (v) => _then(v as _SetEntries));

  @override
  _SetEntries get _value => super._value as _SetEntries;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_SetEntries(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
    ));
  }
}

/// @nodoc

class _$_SetEntries implements _SetEntries {
  const _$_SetEntries(this.conversations);

  @override
  final List<ConversationItem> conversations;

  @override
  String toString() {
    return 'ConversationsSearchEvent.setEntries(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetEntries &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$SetEntriesCopyWith<_SetEntries> get copyWith =>
      __$SetEntriesCopyWithImpl<_SetEntries>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationItem> conversations) setEntries,
    required TResult Function(bool isActive) searchSwitch,
    required TResult Function(String searchString) query,
    required TResult Function(List<ConversationItem> conversations) onResult,
  }) {
    return setEntries(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
  }) {
    return setEntries?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
    required TResult orElse(),
  }) {
    if (setEntries != null) {
      return setEntries(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
  }) {
    return setEntries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
  }) {
    return setEntries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    required TResult orElse(),
  }) {
    if (setEntries != null) {
      return setEntries(this);
    }
    return orElse();
  }
}

abstract class _SetEntries implements ConversationsSearchEvent {
  const factory _SetEntries(List<ConversationItem> conversations) =
      _$_SetEntries;

  List<ConversationItem> get conversations;
  @JsonKey(ignore: true)
  _$SetEntriesCopyWith<_SetEntries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchSwitchCopyWith<$Res> {
  factory _$SearchSwitchCopyWith(
          _SearchSwitch value, $Res Function(_SearchSwitch) then) =
      __$SearchSwitchCopyWithImpl<$Res>;
  $Res call({bool isActive});
}

/// @nodoc
class __$SearchSwitchCopyWithImpl<$Res>
    extends _$ConversationsSearchEventCopyWithImpl<$Res>
    implements _$SearchSwitchCopyWith<$Res> {
  __$SearchSwitchCopyWithImpl(
      _SearchSwitch _value, $Res Function(_SearchSwitch) _then)
      : super(_value, (v) => _then(v as _SearchSwitch));

  @override
  _SearchSwitch get _value => super._value as _SearchSwitch;

  @override
  $Res call({
    Object? isActive = freezed,
  }) {
    return _then(_SearchSwitch(
      isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchSwitch implements _SearchSwitch {
  const _$_SearchSwitch(this.isActive);

  @override
  final bool isActive;

  @override
  String toString() {
    return 'ConversationsSearchEvent.searchSwitch(isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchSwitch &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$SearchSwitchCopyWith<_SearchSwitch> get copyWith =>
      __$SearchSwitchCopyWithImpl<_SearchSwitch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationItem> conversations) setEntries,
    required TResult Function(bool isActive) searchSwitch,
    required TResult Function(String searchString) query,
    required TResult Function(List<ConversationItem> conversations) onResult,
  }) {
    return searchSwitch(isActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
  }) {
    return searchSwitch?.call(isActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
    required TResult orElse(),
  }) {
    if (searchSwitch != null) {
      return searchSwitch(isActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
  }) {
    return searchSwitch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
  }) {
    return searchSwitch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    required TResult orElse(),
  }) {
    if (searchSwitch != null) {
      return searchSwitch(this);
    }
    return orElse();
  }
}

abstract class _SearchSwitch implements ConversationsSearchEvent {
  const factory _SearchSwitch(bool isActive) = _$_SearchSwitch;

  bool get isActive;
  @JsonKey(ignore: true)
  _$SearchSwitchCopyWith<_SearchSwitch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QueryCopyWith<$Res> {
  factory _$QueryCopyWith(_Query value, $Res Function(_Query) then) =
      __$QueryCopyWithImpl<$Res>;
  $Res call({String searchString});
}

/// @nodoc
class __$QueryCopyWithImpl<$Res>
    extends _$ConversationsSearchEventCopyWithImpl<$Res>
    implements _$QueryCopyWith<$Res> {
  __$QueryCopyWithImpl(_Query _value, $Res Function(_Query) _then)
      : super(_value, (v) => _then(v as _Query));

  @override
  _Query get _value => super._value as _Query;

  @override
  $Res call({
    Object? searchString = freezed,
  }) {
    return _then(_Query(
      searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Query implements _Query {
  const _$_Query(this.searchString);

  @override
  final String searchString;

  @override
  String toString() {
    return 'ConversationsSearchEvent.query(searchString: $searchString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Query &&
            const DeepCollectionEquality()
                .equals(other.searchString, searchString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(searchString));

  @JsonKey(ignore: true)
  @override
  _$QueryCopyWith<_Query> get copyWith =>
      __$QueryCopyWithImpl<_Query>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationItem> conversations) setEntries,
    required TResult Function(bool isActive) searchSwitch,
    required TResult Function(String searchString) query,
    required TResult Function(List<ConversationItem> conversations) onResult,
  }) {
    return query(searchString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
  }) {
    return query?.call(searchString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(searchString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
  }) {
    return query(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
  }) {
    return query?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(this);
    }
    return orElse();
  }
}

abstract class _Query implements ConversationsSearchEvent {
  const factory _Query(String searchString) = _$_Query;

  String get searchString;
  @JsonKey(ignore: true)
  _$QueryCopyWith<_Query> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnResultCopyWith<$Res> {
  factory _$OnResultCopyWith(_OnResult value, $Res Function(_OnResult) then) =
      __$OnResultCopyWithImpl<$Res>;
  $Res call({List<ConversationItem> conversations});
}

/// @nodoc
class __$OnResultCopyWithImpl<$Res>
    extends _$ConversationsSearchEventCopyWithImpl<$Res>
    implements _$OnResultCopyWith<$Res> {
  __$OnResultCopyWithImpl(_OnResult _value, $Res Function(_OnResult) _then)
      : super(_value, (v) => _then(v as _OnResult));

  @override
  _OnResult get _value => super._value as _OnResult;

  @override
  $Res call({
    Object? conversations = freezed,
  }) {
    return _then(_OnResult(
      conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
    ));
  }
}

/// @nodoc

class _$_OnResult implements _OnResult {
  const _$_OnResult(this.conversations);

  @override
  final List<ConversationItem> conversations;

  @override
  String toString() {
    return 'ConversationsSearchEvent.onResult(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnResult &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$OnResultCopyWith<_OnResult> get copyWith =>
      __$OnResultCopyWithImpl<_OnResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationItem> conversations) setEntries,
    required TResult Function(bool isActive) searchSwitch,
    required TResult Function(String searchString) query,
    required TResult Function(List<ConversationItem> conversations) onResult,
  }) {
    return onResult(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
  }) {
    return onResult?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations)? setEntries,
    TResult Function(bool isActive)? searchSwitch,
    TResult Function(String searchString)? query,
    TResult Function(List<ConversationItem> conversations)? onResult,
    required TResult orElse(),
  }) {
    if (onResult != null) {
      return onResult(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
  }) {
    return onResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
  }) {
    return onResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    required TResult orElse(),
  }) {
    if (onResult != null) {
      return onResult(this);
    }
    return orElse();
  }
}

abstract class _OnResult implements ConversationsSearchEvent {
  const factory _OnResult(List<ConversationItem> conversations) = _$_OnResult;

  List<ConversationItem> get conversations;
  @JsonKey(ignore: true)
  _$OnResultCopyWith<_OnResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ConversationsSearchStateTearOff {
  const _$ConversationsSearchStateTearOff();

  _State state(
      {required List<ConversationItem> conversations,
      bool isSearchActive = false}) {
    return _State(
      conversations: conversations,
      isSearchActive: isSearchActive,
    );
  }
}

/// @nodoc
const $ConversationsSearchState = _$ConversationsSearchStateTearOff();

/// @nodoc
mixin _$ConversationsSearchState {
  List<ConversationItem> get conversations =>
      throw _privateConstructorUsedError;
  bool get isSearchActive => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationItem> conversations, bool isSearchActive)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations, bool isSearchActive)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations, bool isSearchActive)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_State value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationsSearchStateCopyWith<ConversationsSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationsSearchStateCopyWith<$Res> {
  factory $ConversationsSearchStateCopyWith(ConversationsSearchState value,
          $Res Function(ConversationsSearchState) then) =
      _$ConversationsSearchStateCopyWithImpl<$Res>;
  $Res call({List<ConversationItem> conversations, bool isSearchActive});
}

/// @nodoc
class _$ConversationsSearchStateCopyWithImpl<$Res>
    implements $ConversationsSearchStateCopyWith<$Res> {
  _$ConversationsSearchStateCopyWithImpl(this._value, this._then);

  final ConversationsSearchState _value;
  // ignore: unused_field
  final $Res Function(ConversationsSearchState) _then;

  @override
  $Res call({
    Object? conversations = freezed,
    Object? isSearchActive = freezed,
  }) {
    return _then(_value.copyWith(
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
      isSearchActive: isSearchActive == freezed
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res>
    implements $ConversationsSearchStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call({List<ConversationItem> conversations, bool isSearchActive});
}

/// @nodoc
class __$StateCopyWithImpl<$Res>
    extends _$ConversationsSearchStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? conversations = freezed,
    Object? isSearchActive = freezed,
  }) {
    return _then(_State(
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationItem>,
      isSearchActive: isSearchActive == freezed
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_State extends _State {
  const _$_State({required this.conversations, this.isSearchActive = false})
      : super._();

  @override
  final List<ConversationItem> conversations;
  @JsonKey()
  @override
  final bool isSearchActive;

  @override
  String toString() {
    return 'ConversationsSearchState.state(conversations: $conversations, isSearchActive: $isSearchActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _State &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations) &&
            const DeepCollectionEquality()
                .equals(other.isSearchActive, isSearchActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversations),
      const DeepCollectionEquality().hash(isSearchActive));

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ConversationItem> conversations, bool isSearchActive)
        state,
  }) {
    return state(conversations, isSearchActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations, bool isSearchActive)?
        state,
  }) {
    return state?.call(conversations, isSearchActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationItem> conversations, bool isSearchActive)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(conversations, isSearchActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_State value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _State extends ConversationsSearchState {
  const factory _State(
      {required List<ConversationItem> conversations,
      bool isSearchActive}) = _$_State;
  const _State._() : super._();

  @override
  List<ConversationItem> get conversations;
  @override
  bool get isSearchActive;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}
