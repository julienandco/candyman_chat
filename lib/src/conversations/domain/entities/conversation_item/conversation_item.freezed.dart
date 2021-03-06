// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationItemTearOff {
  const _$ConversationItemTearOff();

  _ConversationItem call(
      {required Conversation conversation,
      required ConversationMessage lastMessage,
      required int unreadMessagesCount}) {
    return _ConversationItem(
      conversation: conversation,
      lastMessage: lastMessage,
      unreadMessagesCount: unreadMessagesCount,
    );
  }
}

/// @nodoc
const $ConversationItem = _$ConversationItemTearOff();

/// @nodoc
mixin _$ConversationItem {
  Conversation get conversation => throw _privateConstructorUsedError;
  ConversationMessage get lastMessage => throw _privateConstructorUsedError;
  int get unreadMessagesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationItemCopyWith<ConversationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationItemCopyWith<$Res> {
  factory $ConversationItemCopyWith(
          ConversationItem value, $Res Function(ConversationItem) then) =
      _$ConversationItemCopyWithImpl<$Res>;
  $Res call(
      {Conversation conversation,
      ConversationMessage lastMessage,
      int unreadMessagesCount});

  $ConversationCopyWith<$Res> get conversation;
  $ConversationMessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class _$ConversationItemCopyWithImpl<$Res>
    implements $ConversationItemCopyWith<$Res> {
  _$ConversationItemCopyWithImpl(this._value, this._then);

  final ConversationItem _value;
  // ignore: unused_field
  final $Res Function(ConversationItem) _then;

  @override
  $Res call({
    Object? conversation = freezed,
    Object? lastMessage = freezed,
    Object? unreadMessagesCount = freezed,
  }) {
    return _then(_value.copyWith(
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ConversationMessage,
      unreadMessagesCount: unreadMessagesCount == freezed
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_value.conversation, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }

  @override
  $ConversationMessageCopyWith<$Res> get lastMessage {
    return $ConversationMessageCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationItemCopyWith<$Res>
    implements $ConversationItemCopyWith<$Res> {
  factory _$ConversationItemCopyWith(
          _ConversationItem value, $Res Function(_ConversationItem) then) =
      __$ConversationItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {Conversation conversation,
      ConversationMessage lastMessage,
      int unreadMessagesCount});

  @override
  $ConversationCopyWith<$Res> get conversation;
  @override
  $ConversationMessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class __$ConversationItemCopyWithImpl<$Res>
    extends _$ConversationItemCopyWithImpl<$Res>
    implements _$ConversationItemCopyWith<$Res> {
  __$ConversationItemCopyWithImpl(
      _ConversationItem _value, $Res Function(_ConversationItem) _then)
      : super(_value, (v) => _then(v as _ConversationItem));

  @override
  _ConversationItem get _value => super._value as _ConversationItem;

  @override
  $Res call({
    Object? conversation = freezed,
    Object? lastMessage = freezed,
    Object? unreadMessagesCount = freezed,
  }) {
    return _then(_ConversationItem(
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ConversationMessage,
      unreadMessagesCount: unreadMessagesCount == freezed
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ConversationItem implements _ConversationItem {
  _$_ConversationItem(
      {required this.conversation,
      required this.lastMessage,
      required this.unreadMessagesCount});

  @override
  final Conversation conversation;
  @override
  final ConversationMessage lastMessage;
  @override
  final int unreadMessagesCount;

  @override
  String toString() {
    return 'ConversationItem(conversation: $conversation, lastMessage: $lastMessage, unreadMessagesCount: $unreadMessagesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationItem &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage) &&
            const DeepCollectionEquality()
                .equals(other.unreadMessagesCount, unreadMessagesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversation),
      const DeepCollectionEquality().hash(lastMessage),
      const DeepCollectionEquality().hash(unreadMessagesCount));

  @JsonKey(ignore: true)
  @override
  _$ConversationItemCopyWith<_ConversationItem> get copyWith =>
      __$ConversationItemCopyWithImpl<_ConversationItem>(this, _$identity);
}

abstract class _ConversationItem implements ConversationItem {
  factory _ConversationItem(
      {required Conversation conversation,
      required ConversationMessage lastMessage,
      required int unreadMessagesCount}) = _$_ConversationItem;

  @override
  Conversation get conversation;
  @override
  ConversationMessage get lastMessage;
  @override
  int get unreadMessagesCount;
  @override
  @JsonKey(ignore: true)
  _$ConversationItemCopyWith<_ConversationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
