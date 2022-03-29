// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_conversation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentConversationStateTearOff {
  const _$CurrentConversationStateTearOff();

  _State current({ConversationItem? conversationItem}) {
    return _State(
      conversationItem: conversationItem,
    );
  }
}

/// @nodoc
const $CurrentConversationState = _$CurrentConversationStateTearOff();

/// @nodoc
mixin _$CurrentConversationState {
  ConversationItem? get conversationItem => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationItem? conversationItem) current,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ConversationItem? conversationItem)? current,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationItem? conversationItem)? current,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) current,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_State value)? current,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? current,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentConversationStateCopyWith<CurrentConversationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentConversationStateCopyWith<$Res> {
  factory $CurrentConversationStateCopyWith(CurrentConversationState value,
          $Res Function(CurrentConversationState) then) =
      _$CurrentConversationStateCopyWithImpl<$Res>;
  $Res call({ConversationItem? conversationItem});
}

/// @nodoc
class _$CurrentConversationStateCopyWithImpl<$Res>
    implements $CurrentConversationStateCopyWith<$Res> {
  _$CurrentConversationStateCopyWithImpl(this._value, this._then);

  final CurrentConversationState _value;
  // ignore: unused_field
  final $Res Function(CurrentConversationState) _then;

  @override
  $Res call({
    Object? conversationItem = freezed,
  }) {
    return _then(_value.copyWith(
      conversationItem: conversationItem == freezed
          ? _value.conversationItem
          : conversationItem // ignore: cast_nullable_to_non_nullable
              as ConversationItem?,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res>
    implements $CurrentConversationStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call({ConversationItem? conversationItem});
}

/// @nodoc
class __$StateCopyWithImpl<$Res>
    extends _$CurrentConversationStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? conversationItem = freezed,
  }) {
    return _then(_State(
      conversationItem: conversationItem == freezed
          ? _value.conversationItem
          : conversationItem // ignore: cast_nullable_to_non_nullable
              as ConversationItem?,
    ));
  }
}

/// @nodoc

class _$_State implements _State {
  const _$_State({this.conversationItem});

  @override
  final ConversationItem? conversationItem;

  @override
  String toString() {
    return 'CurrentConversationState.current(conversationItem: $conversationItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _State &&
            const DeepCollectionEquality()
                .equals(other.conversationItem, conversationItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(conversationItem));

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationItem? conversationItem) current,
  }) {
    return current(conversationItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ConversationItem? conversationItem)? current,
  }) {
    return current?.call(conversationItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationItem? conversationItem)? current,
    required TResult orElse(),
  }) {
    if (current != null) {
      return current(conversationItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_State value) current,
  }) {
    return current(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_State value)? current,
  }) {
    return current?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_State value)? current,
    required TResult orElse(),
  }) {
    if (current != null) {
      return current(this);
    }
    return orElse();
  }
}

abstract class _State implements CurrentConversationState {
  const factory _State({ConversationItem? conversationItem}) = _$_State;

  @override
  ConversationItem? get conversationItem;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}
