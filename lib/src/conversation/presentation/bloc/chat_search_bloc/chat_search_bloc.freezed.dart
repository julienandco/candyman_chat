// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatSearchStateTearOff {
  const _$ChatSearchStateTearOff();

  _State state(
      {required List<int> messageIndices,
      int currentResultIndex = 0,
      bool isSearchActive = false}) {
    return _State(
      messageIndices: messageIndices,
      currentResultIndex: currentResultIndex,
      isSearchActive: isSearchActive,
    );
  }
}

/// @nodoc
const $ChatSearchState = _$ChatSearchStateTearOff();

/// @nodoc
mixin _$ChatSearchState {
  List<int> get messageIndices => throw _privateConstructorUsedError;
  int get currentResultIndex => throw _privateConstructorUsedError;
  bool get isSearchActive => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)?
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
  $ChatSearchStateCopyWith<ChatSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSearchStateCopyWith<$Res> {
  factory $ChatSearchStateCopyWith(
          ChatSearchState value, $Res Function(ChatSearchState) then) =
      _$ChatSearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<int> messageIndices, int currentResultIndex, bool isSearchActive});
}

/// @nodoc
class _$ChatSearchStateCopyWithImpl<$Res>
    implements $ChatSearchStateCopyWith<$Res> {
  _$ChatSearchStateCopyWithImpl(this._value, this._then);

  final ChatSearchState _value;
  // ignore: unused_field
  final $Res Function(ChatSearchState) _then;

  @override
  $Res call({
    Object? messageIndices = freezed,
    Object? currentResultIndex = freezed,
    Object? isSearchActive = freezed,
  }) {
    return _then(_value.copyWith(
      messageIndices: messageIndices == freezed
          ? _value.messageIndices
          : messageIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentResultIndex: currentResultIndex == freezed
          ? _value.currentResultIndex
          : currentResultIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchActive: isSearchActive == freezed
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res> implements $ChatSearchStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<int> messageIndices, int currentResultIndex, bool isSearchActive});
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$ChatSearchStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? messageIndices = freezed,
    Object? currentResultIndex = freezed,
    Object? isSearchActive = freezed,
  }) {
    return _then(_State(
      messageIndices: messageIndices == freezed
          ? _value.messageIndices
          : messageIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentResultIndex: currentResultIndex == freezed
          ? _value.currentResultIndex
          : currentResultIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchActive: isSearchActive == freezed
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_State extends _State {
  const _$_State(
      {required this.messageIndices,
      this.currentResultIndex = 0,
      this.isSearchActive = false})
      : super._();

  @override
  final List<int> messageIndices;
  @JsonKey()
  @override
  final int currentResultIndex;
  @JsonKey()
  @override
  final bool isSearchActive;

  @override
  String toString() {
    return 'ChatSearchState.state(messageIndices: $messageIndices, currentResultIndex: $currentResultIndex, isSearchActive: $isSearchActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _State &&
            const DeepCollectionEquality()
                .equals(other.messageIndices, messageIndices) &&
            const DeepCollectionEquality()
                .equals(other.currentResultIndex, currentResultIndex) &&
            const DeepCollectionEquality()
                .equals(other.isSearchActive, isSearchActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messageIndices),
      const DeepCollectionEquality().hash(currentResultIndex),
      const DeepCollectionEquality().hash(isSearchActive));

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)
        state,
  }) {
    return state(messageIndices, currentResultIndex, isSearchActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)?
        state,
  }) {
    return state?.call(messageIndices, currentResultIndex, isSearchActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<int> messageIndices, int currentResultIndex,
            bool isSearchActive)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(messageIndices, currentResultIndex, isSearchActive);
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

abstract class _State extends ChatSearchState {
  const factory _State(
      {required List<int> messageIndices,
      int currentResultIndex,
      bool isSearchActive}) = _$_State;
  const _State._() : super._();

  @override
  List<int> get messageIndices;
  @override
  int get currentResultIndex;
  @override
  bool get isSearchActive;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ChatSearchEventTearOff {
  const _$ChatSearchEventTearOff();

  _SetEntries setEntries(List<ChatMessage> messages) {
    return _SetEntries(
      messages,
    );
  }

  _SearchSwitch searchSwitch() {
    return const _SearchSwitch();
  }

  _Query query(String term) {
    return _Query(
      term,
    );
  }

  _OnResult onResult(List<int> messageIndices) {
    return _OnResult(
      messageIndices,
    );
  }

  _OnGoResultUp onGoResultUp() {
    return const _OnGoResultUp();
  }

  _OnGoResultDown onGoResultDown() {
    return const _OnGoResultDown();
  }
}

/// @nodoc
const $ChatSearchEvent = _$ChatSearchEventTearOff();

/// @nodoc
mixin _$ChatSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEntries value) setEntries,
    required TResult Function(_SearchSwitch value) searchSwitch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnResult value) onResult,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSearchEventCopyWith<$Res> {
  factory $ChatSearchEventCopyWith(
          ChatSearchEvent value, $Res Function(ChatSearchEvent) then) =
      _$ChatSearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatSearchEventCopyWithImpl<$Res>
    implements $ChatSearchEventCopyWith<$Res> {
  _$ChatSearchEventCopyWithImpl(this._value, this._then);

  final ChatSearchEvent _value;
  // ignore: unused_field
  final $Res Function(ChatSearchEvent) _then;
}

/// @nodoc
abstract class _$SetEntriesCopyWith<$Res> {
  factory _$SetEntriesCopyWith(
          _SetEntries value, $Res Function(_SetEntries) then) =
      __$SetEntriesCopyWithImpl<$Res>;
  $Res call({List<ChatMessage> messages});
}

/// @nodoc
class __$SetEntriesCopyWithImpl<$Res>
    extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$SetEntriesCopyWith<$Res> {
  __$SetEntriesCopyWithImpl(
      _SetEntries _value, $Res Function(_SetEntries) _then)
      : super(_value, (v) => _then(v as _SetEntries));

  @override
  _SetEntries get _value => super._value as _SetEntries;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_SetEntries(
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$_SetEntries implements _SetEntries {
  const _$_SetEntries(this.messages);

  @override
  final List<ChatMessage> messages;

  @override
  String toString() {
    return 'ChatSearchEvent.setEntries(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetEntries &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$SetEntriesCopyWith<_SetEntries> get copyWith =>
      __$SetEntriesCopyWithImpl<_SetEntries>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return setEntries(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return setEntries?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (setEntries != null) {
      return setEntries(messages);
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (setEntries != null) {
      return setEntries(this);
    }
    return orElse();
  }
}

abstract class _SetEntries implements ChatSearchEvent {
  const factory _SetEntries(List<ChatMessage> messages) = _$_SetEntries;

  List<ChatMessage> get messages;
  @JsonKey(ignore: true)
  _$SetEntriesCopyWith<_SetEntries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchSwitchCopyWith<$Res> {
  factory _$SearchSwitchCopyWith(
          _SearchSwitch value, $Res Function(_SearchSwitch) then) =
      __$SearchSwitchCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchSwitchCopyWithImpl<$Res>
    extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$SearchSwitchCopyWith<$Res> {
  __$SearchSwitchCopyWithImpl(
      _SearchSwitch _value, $Res Function(_SearchSwitch) _then)
      : super(_value, (v) => _then(v as _SearchSwitch));

  @override
  _SearchSwitch get _value => super._value as _SearchSwitch;
}

/// @nodoc

class _$_SearchSwitch implements _SearchSwitch {
  const _$_SearchSwitch();

  @override
  String toString() {
    return 'ChatSearchEvent.searchSwitch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchSwitch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return searchSwitch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return searchSwitch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (searchSwitch != null) {
      return searchSwitch();
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (searchSwitch != null) {
      return searchSwitch(this);
    }
    return orElse();
  }
}

abstract class _SearchSwitch implements ChatSearchEvent {
  const factory _SearchSwitch() = _$_SearchSwitch;
}

/// @nodoc
abstract class _$QueryCopyWith<$Res> {
  factory _$QueryCopyWith(_Query value, $Res Function(_Query) then) =
      __$QueryCopyWithImpl<$Res>;
  $Res call({String term});
}

/// @nodoc
class __$QueryCopyWithImpl<$Res> extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$QueryCopyWith<$Res> {
  __$QueryCopyWithImpl(_Query _value, $Res Function(_Query) _then)
      : super(_value, (v) => _then(v as _Query));

  @override
  _Query get _value => super._value as _Query;

  @override
  $Res call({
    Object? term = freezed,
  }) {
    return _then(_Query(
      term == freezed
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Query implements _Query {
  const _$_Query(this.term);

  @override
  final String term;

  @override
  String toString() {
    return 'ChatSearchEvent.query(term: $term)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Query &&
            const DeepCollectionEquality().equals(other.term, term));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(term));

  @JsonKey(ignore: true)
  @override
  _$QueryCopyWith<_Query> get copyWith =>
      __$QueryCopyWithImpl<_Query>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return query(term);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return query?.call(term);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(term);
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (query != null) {
      return query(this);
    }
    return orElse();
  }
}

abstract class _Query implements ChatSearchEvent {
  const factory _Query(String term) = _$_Query;

  String get term;
  @JsonKey(ignore: true)
  _$QueryCopyWith<_Query> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnResultCopyWith<$Res> {
  factory _$OnResultCopyWith(_OnResult value, $Res Function(_OnResult) then) =
      __$OnResultCopyWithImpl<$Res>;
  $Res call({List<int> messageIndices});
}

/// @nodoc
class __$OnResultCopyWithImpl<$Res> extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$OnResultCopyWith<$Res> {
  __$OnResultCopyWithImpl(_OnResult _value, $Res Function(_OnResult) _then)
      : super(_value, (v) => _then(v as _OnResult));

  @override
  _OnResult get _value => super._value as _OnResult;

  @override
  $Res call({
    Object? messageIndices = freezed,
  }) {
    return _then(_OnResult(
      messageIndices == freezed
          ? _value.messageIndices
          : messageIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_OnResult implements _OnResult {
  const _$_OnResult(this.messageIndices);

  @override
  final List<int> messageIndices;

  @override
  String toString() {
    return 'ChatSearchEvent.onResult(messageIndices: $messageIndices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnResult &&
            const DeepCollectionEquality()
                .equals(other.messageIndices, messageIndices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(messageIndices));

  @JsonKey(ignore: true)
  @override
  _$OnResultCopyWith<_OnResult> get copyWith =>
      __$OnResultCopyWithImpl<_OnResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return onResult(messageIndices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return onResult?.call(messageIndices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onResult != null) {
      return onResult(messageIndices);
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
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
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onResult != null) {
      return onResult(this);
    }
    return orElse();
  }
}

abstract class _OnResult implements ChatSearchEvent {
  const factory _OnResult(List<int> messageIndices) = _$_OnResult;

  List<int> get messageIndices;
  @JsonKey(ignore: true)
  _$OnResultCopyWith<_OnResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnGoResultUpCopyWith<$Res> {
  factory _$OnGoResultUpCopyWith(
          _OnGoResultUp value, $Res Function(_OnGoResultUp) then) =
      __$OnGoResultUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnGoResultUpCopyWithImpl<$Res>
    extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$OnGoResultUpCopyWith<$Res> {
  __$OnGoResultUpCopyWithImpl(
      _OnGoResultUp _value, $Res Function(_OnGoResultUp) _then)
      : super(_value, (v) => _then(v as _OnGoResultUp));

  @override
  _OnGoResultUp get _value => super._value as _OnGoResultUp;
}

/// @nodoc

class _$_OnGoResultUp implements _OnGoResultUp {
  const _$_OnGoResultUp();

  @override
  String toString() {
    return 'ChatSearchEvent.onGoResultUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnGoResultUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return onGoResultUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return onGoResultUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onGoResultUp != null) {
      return onGoResultUp();
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return onGoResultUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return onGoResultUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onGoResultUp != null) {
      return onGoResultUp(this);
    }
    return orElse();
  }
}

abstract class _OnGoResultUp implements ChatSearchEvent {
  const factory _OnGoResultUp() = _$_OnGoResultUp;
}

/// @nodoc
abstract class _$OnGoResultDownCopyWith<$Res> {
  factory _$OnGoResultDownCopyWith(
          _OnGoResultDown value, $Res Function(_OnGoResultDown) then) =
      __$OnGoResultDownCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnGoResultDownCopyWithImpl<$Res>
    extends _$ChatSearchEventCopyWithImpl<$Res>
    implements _$OnGoResultDownCopyWith<$Res> {
  __$OnGoResultDownCopyWithImpl(
      _OnGoResultDown _value, $Res Function(_OnGoResultDown) _then)
      : super(_value, (v) => _then(v as _OnGoResultDown));

  @override
  _OnGoResultDown get _value => super._value as _OnGoResultDown;
}

/// @nodoc

class _$_OnGoResultDown implements _OnGoResultDown {
  const _$_OnGoResultDown();

  @override
  String toString() {
    return 'ChatSearchEvent.onGoResultDown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OnGoResultDown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ChatMessage> messages) setEntries,
    required TResult Function() searchSwitch,
    required TResult Function(String term) query,
    required TResult Function(List<int> messageIndices) onResult,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return onGoResultDown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return onGoResultDown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ChatMessage> messages)? setEntries,
    TResult Function()? searchSwitch,
    TResult Function(String term)? query,
    TResult Function(List<int> messageIndices)? onResult,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onGoResultDown != null) {
      return onGoResultDown();
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
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return onGoResultDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return onGoResultDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEntries value)? setEntries,
    TResult Function(_SearchSwitch value)? searchSwitch,
    TResult Function(_Query value)? query,
    TResult Function(_OnResult value)? onResult,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (onGoResultDown != null) {
      return onGoResultDown(this);
    }
    return orElse();
  }
}

abstract class _OnGoResultDown implements ChatSearchEvent {
  const factory _OnGoResultDown() = _$_OnGoResultDown;
}
