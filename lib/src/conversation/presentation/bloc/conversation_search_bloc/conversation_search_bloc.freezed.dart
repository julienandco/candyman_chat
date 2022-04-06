// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationSearchStateTearOff {
  const _$ConversationSearchStateTearOff();

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
const $ConversationSearchState = _$ConversationSearchStateTearOff();

/// @nodoc
mixin _$ConversationSearchState {
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
  $ConversationSearchStateCopyWith<ConversationSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationSearchStateCopyWith<$Res> {
  factory $ConversationSearchStateCopyWith(ConversationSearchState value,
          $Res Function(ConversationSearchState) then) =
      _$ConversationSearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<int> messageIndices, int currentResultIndex, bool isSearchActive});
}

/// @nodoc
class _$ConversationSearchStateCopyWithImpl<$Res>
    implements $ConversationSearchStateCopyWith<$Res> {
  _$ConversationSearchStateCopyWithImpl(this._value, this._then);

  final ConversationSearchState _value;
  // ignore: unused_field
  final $Res Function(ConversationSearchState) _then;

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
abstract class _$StateCopyWith<$Res>
    implements $ConversationSearchStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<int> messageIndices, int currentResultIndex, bool isSearchActive});
}

/// @nodoc
class __$StateCopyWithImpl<$Res>
    extends _$ConversationSearchStateCopyWithImpl<$Res>
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
    return 'ConversationSearchState.state(messageIndices: $messageIndices, currentResultIndex: $currentResultIndex, isSearchActive: $isSearchActive)';
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

abstract class _State extends ConversationSearchState {
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
class _$ConversationSearchEventTearOff {
  const _$ConversationSearchEventTearOff();

  _Initialize initialize(
      {required List<ConversationMessage> messages,
      required DateTime lastSeenMessageTimestamp}) {
    return _Initialize(
      messages: messages,
      lastSeenMessageTimestamp: lastSeenMessageTimestamp,
    );
  }

  _ToggleSearch toggleSearch() {
    return const _ToggleSearch();
  }

  _Query query(String term) {
    return _Query(
      term,
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
const $ConversationSearchEvent = _$ConversationSearchEventTearOff();

/// @nodoc
mixin _$ConversationSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationSearchEventCopyWith<$Res> {
  factory $ConversationSearchEventCopyWith(ConversationSearchEvent value,
          $Res Function(ConversationSearchEvent) then) =
      _$ConversationSearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConversationSearchEventCopyWithImpl<$Res>
    implements $ConversationSearchEventCopyWith<$Res> {
  _$ConversationSearchEventCopyWithImpl(this._value, this._then);

  final ConversationSearchEvent _value;
  // ignore: unused_field
  final $Res Function(ConversationSearchEvent) _then;
}

/// @nodoc
abstract class _$InitializeCopyWith<$Res> {
  factory _$InitializeCopyWith(
          _Initialize value, $Res Function(_Initialize) then) =
      __$InitializeCopyWithImpl<$Res>;
  $Res call(
      {List<ConversationMessage> messages, DateTime lastSeenMessageTimestamp});
}

/// @nodoc
class __$InitializeCopyWithImpl<$Res>
    extends _$ConversationSearchEventCopyWithImpl<$Res>
    implements _$InitializeCopyWith<$Res> {
  __$InitializeCopyWithImpl(
      _Initialize _value, $Res Function(_Initialize) _then)
      : super(_value, (v) => _then(v as _Initialize));

  @override
  _Initialize get _value => super._value as _Initialize;

  @override
  $Res call({
    Object? messages = freezed,
    Object? lastSeenMessageTimestamp = freezed,
  }) {
    return _then(_Initialize(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ConversationMessage>,
      lastSeenMessageTimestamp: lastSeenMessageTimestamp == freezed
          ? _value.lastSeenMessageTimestamp
          : lastSeenMessageTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize(
      {required this.messages, required this.lastSeenMessageTimestamp});

  @override
  final List<ConversationMessage> messages;
  @override
  final DateTime lastSeenMessageTimestamp;

  @override
  String toString() {
    return 'ConversationSearchEvent.initialize(messages: $messages, lastSeenMessageTimestamp: $lastSeenMessageTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initialize &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(
                other.lastSeenMessageTimestamp, lastSeenMessageTimestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(lastSeenMessageTimestamp));

  @JsonKey(ignore: true)
  @override
  _$InitializeCopyWith<_Initialize> get copyWith =>
      __$InitializeCopyWithImpl<_Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return initialize(messages, lastSeenMessageTimestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return initialize?.call(messages, lastSeenMessageTimestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(messages, lastSeenMessageTimestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ConversationSearchEvent {
  const factory _Initialize(
      {required List<ConversationMessage> messages,
      required DateTime lastSeenMessageTimestamp}) = _$_Initialize;

  List<ConversationMessage> get messages;
  DateTime get lastSeenMessageTimestamp;
  @JsonKey(ignore: true)
  _$InitializeCopyWith<_Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ToggleSearchCopyWith<$Res> {
  factory _$ToggleSearchCopyWith(
          _ToggleSearch value, $Res Function(_ToggleSearch) then) =
      __$ToggleSearchCopyWithImpl<$Res>;
}

/// @nodoc
class __$ToggleSearchCopyWithImpl<$Res>
    extends _$ConversationSearchEventCopyWithImpl<$Res>
    implements _$ToggleSearchCopyWith<$Res> {
  __$ToggleSearchCopyWithImpl(
      _ToggleSearch _value, $Res Function(_ToggleSearch) _then)
      : super(_value, (v) => _then(v as _ToggleSearch));

  @override
  _ToggleSearch get _value => super._value as _ToggleSearch;
}

/// @nodoc

class _$_ToggleSearch implements _ToggleSearch {
  const _$_ToggleSearch();

  @override
  String toString() {
    return 'ConversationSearchEvent.toggleSearch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ToggleSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return toggleSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return toggleSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
    required TResult orElse(),
  }) {
    if (toggleSearch != null) {
      return toggleSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return toggleSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return toggleSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
    required TResult orElse(),
  }) {
    if (toggleSearch != null) {
      return toggleSearch(this);
    }
    return orElse();
  }
}

abstract class _ToggleSearch implements ConversationSearchEvent {
  const factory _ToggleSearch() = _$_ToggleSearch;
}

/// @nodoc
abstract class _$QueryCopyWith<$Res> {
  factory _$QueryCopyWith(_Query value, $Res Function(_Query) then) =
      __$QueryCopyWithImpl<$Res>;
  $Res call({String term});
}

/// @nodoc
class __$QueryCopyWithImpl<$Res>
    extends _$ConversationSearchEventCopyWithImpl<$Res>
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
    return 'ConversationSearchEvent.query(term: $term)';
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
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return query(term);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return query?.call(term);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return query(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return query?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
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

abstract class _Query implements ConversationSearchEvent {
  const factory _Query(String term) = _$_Query;

  String get term;
  @JsonKey(ignore: true)
  _$QueryCopyWith<_Query> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnGoResultUpCopyWith<$Res> {
  factory _$OnGoResultUpCopyWith(
          _OnGoResultUp value, $Res Function(_OnGoResultUp) then) =
      __$OnGoResultUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnGoResultUpCopyWithImpl<$Res>
    extends _$ConversationSearchEventCopyWithImpl<$Res>
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
    return 'ConversationSearchEvent.onGoResultUp()';
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
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return onGoResultUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return onGoResultUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return onGoResultUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return onGoResultUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
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

abstract class _OnGoResultUp implements ConversationSearchEvent {
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
    extends _$ConversationSearchEventCopyWithImpl<$Res>
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
    return 'ConversationSearchEvent.onGoResultDown()';
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
    required TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)
        initialize,
    required TResult Function() toggleSearch,
    required TResult Function(String term) query,
    required TResult Function() onGoResultUp,
    required TResult Function() onGoResultDown,
  }) {
    return onGoResultDown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
    TResult Function()? onGoResultUp,
    TResult Function()? onGoResultDown,
  }) {
    return onGoResultDown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages,
            DateTime lastSeenMessageTimestamp)?
        initialize,
    TResult Function()? toggleSearch,
    TResult Function(String term)? query,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ToggleSearch value) toggleSearch,
    required TResult Function(_Query value) query,
    required TResult Function(_OnGoResultUp value) onGoResultUp,
    required TResult Function(_OnGoResultDown value) onGoResultDown,
  }) {
    return onGoResultDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
    TResult Function(_OnGoResultUp value)? onGoResultUp,
    TResult Function(_OnGoResultDown value)? onGoResultDown,
  }) {
    return onGoResultDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ToggleSearch value)? toggleSearch,
    TResult Function(_Query value)? query,
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

abstract class _OnGoResultDown implements ConversationSearchEvent {
  const factory _OnGoResultDown() = _$_OnGoResultDown;
}
