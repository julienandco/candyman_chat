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
      required ChatMessage lastMessage,
      required String displayName,
      required FirebaseUser conversationPartner,
      required int unreadMessagesCount}) {
    return _ConversationItem(
      conversation: conversation,
      lastMessage: lastMessage,
      displayName: displayName,
      conversationPartner: conversationPartner,
      unreadMessagesCount: unreadMessagesCount,
    );
  }

  _GroupConversationItem groupConversation(
      {required Conversation conversation,
      required ChatMessage lastMessage,
      required String displayName,
      String? thumbnail,
      required int unreadMessagesCount}) {
    return _GroupConversationItem(
      conversation: conversation,
      lastMessage: lastMessage,
      displayName: displayName,
      thumbnail: thumbnail,
      unreadMessagesCount: unreadMessagesCount,
    );
  }
}

/// @nodoc
const $ConversationItem = _$ConversationItemTearOff();

/// @nodoc
mixin _$ConversationItem {
  Conversation get conversation => throw _privateConstructorUsedError;
  ChatMessage get lastMessage => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get unreadMessagesCount => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)
        $default, {
    required TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            String? thumbnail,
            int unreadMessagesCount)
        groupConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ConversationItem value) $default, {
    required TResult Function(_GroupConversationItem value) groupConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
      ChatMessage lastMessage,
      String displayName,
      int unreadMessagesCount});

  $ConversationCopyWith<$Res> get conversation;
  $ChatMessageCopyWith<$Res> get lastMessage;
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
    Object? displayName = freezed,
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
              as ChatMessage,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
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
  $ChatMessageCopyWith<$Res> get lastMessage {
    return $ChatMessageCopyWith<$Res>(_value.lastMessage, (value) {
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
      ChatMessage lastMessage,
      String displayName,
      FirebaseUser conversationPartner,
      int unreadMessagesCount});

  @override
  $ConversationCopyWith<$Res> get conversation;
  @override
  $ChatMessageCopyWith<$Res> get lastMessage;
  $FirebaseUserCopyWith<$Res> get conversationPartner;
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
    Object? displayName = freezed,
    Object? conversationPartner = freezed,
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
              as ChatMessage,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      conversationPartner: conversationPartner == freezed
          ? _value.conversationPartner
          : conversationPartner // ignore: cast_nullable_to_non_nullable
              as FirebaseUser,
      unreadMessagesCount: unreadMessagesCount == freezed
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_ConversationItem implements _ConversationItem {
  _$_ConversationItem(
      {required this.conversation,
      required this.lastMessage,
      required this.displayName,
      required this.conversationPartner,
      required this.unreadMessagesCount});

  @override
  final Conversation conversation;
  @override
  final ChatMessage lastMessage;
  @override
  final String displayName;
  @override
  final FirebaseUser conversationPartner;
  @override
  final int unreadMessagesCount;

  @override
  String toString() {
    return 'ConversationItem(conversation: $conversation, lastMessage: $lastMessage, displayName: $displayName, conversationPartner: $conversationPartner, unreadMessagesCount: $unreadMessagesCount)';
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
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.conversationPartner, conversationPartner) &&
            const DeepCollectionEquality()
                .equals(other.unreadMessagesCount, unreadMessagesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversation),
      const DeepCollectionEquality().hash(lastMessage),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(conversationPartner),
      const DeepCollectionEquality().hash(unreadMessagesCount));

  @JsonKey(ignore: true)
  @override
  _$ConversationItemCopyWith<_ConversationItem> get copyWith =>
      __$ConversationItemCopyWithImpl<_ConversationItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)
        $default, {
    required TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            String? thumbnail,
            int unreadMessagesCount)
        groupConversation,
  }) {
    return $default(conversation, lastMessage, displayName, conversationPartner,
        unreadMessagesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
  }) {
    return $default?.call(conversation, lastMessage, displayName,
        conversationPartner, unreadMessagesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(conversation, lastMessage, displayName,
          conversationPartner, unreadMessagesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ConversationItem value) $default, {
    required TResult Function(_GroupConversationItem value) groupConversation,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ConversationItem implements ConversationItem {
  factory _ConversationItem(
      {required Conversation conversation,
      required ChatMessage lastMessage,
      required String displayName,
      required FirebaseUser conversationPartner,
      required int unreadMessagesCount}) = _$_ConversationItem;

  @override
  Conversation get conversation;
  @override
  ChatMessage get lastMessage;
  @override
  String get displayName;
  FirebaseUser get conversationPartner;
  @override
  int get unreadMessagesCount;
  @override
  @JsonKey(ignore: true)
  _$ConversationItemCopyWith<_ConversationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GroupConversationItemCopyWith<$Res>
    implements $ConversationItemCopyWith<$Res> {
  factory _$GroupConversationItemCopyWith(_GroupConversationItem value,
          $Res Function(_GroupConversationItem) then) =
      __$GroupConversationItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {Conversation conversation,
      ChatMessage lastMessage,
      String displayName,
      String? thumbnail,
      int unreadMessagesCount});

  @override
  $ConversationCopyWith<$Res> get conversation;
  @override
  $ChatMessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class __$GroupConversationItemCopyWithImpl<$Res>
    extends _$ConversationItemCopyWithImpl<$Res>
    implements _$GroupConversationItemCopyWith<$Res> {
  __$GroupConversationItemCopyWithImpl(_GroupConversationItem _value,
      $Res Function(_GroupConversationItem) _then)
      : super(_value, (v) => _then(v as _GroupConversationItem));

  @override
  _GroupConversationItem get _value => super._value as _GroupConversationItem;

  @override
  $Res call({
    Object? conversation = freezed,
    Object? lastMessage = freezed,
    Object? displayName = freezed,
    Object? thumbnail = freezed,
    Object? unreadMessagesCount = freezed,
  }) {
    return _then(_GroupConversationItem(
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadMessagesCount: unreadMessagesCount == freezed
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GroupConversationItem implements _GroupConversationItem {
  _$_GroupConversationItem(
      {required this.conversation,
      required this.lastMessage,
      required this.displayName,
      this.thumbnail,
      required this.unreadMessagesCount});

  @override
  final Conversation conversation;
  @override
  final ChatMessage lastMessage;
  @override
  final String displayName;
  @override
  final String? thumbnail;
  @override
  final int unreadMessagesCount;

  @override
  String toString() {
    return 'ConversationItem.groupConversation(conversation: $conversation, lastMessage: $lastMessage, displayName: $displayName, thumbnail: $thumbnail, unreadMessagesCount: $unreadMessagesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupConversationItem &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.unreadMessagesCount, unreadMessagesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(conversation),
      const DeepCollectionEquality().hash(lastMessage),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(unreadMessagesCount));

  @JsonKey(ignore: true)
  @override
  _$GroupConversationItemCopyWith<_GroupConversationItem> get copyWith =>
      __$GroupConversationItemCopyWithImpl<_GroupConversationItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)
        $default, {
    required TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            String? thumbnail,
            int unreadMessagesCount)
        groupConversation,
  }) {
    return groupConversation(
        conversation, lastMessage, displayName, thumbnail, unreadMessagesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
  }) {
    return groupConversation?.call(
        conversation, lastMessage, displayName, thumbnail, unreadMessagesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            Conversation conversation,
            ChatMessage lastMessage,
            String displayName,
            FirebaseUser conversationPartner,
            int unreadMessagesCount)?
        $default, {
    TResult Function(Conversation conversation, ChatMessage lastMessage,
            String displayName, String? thumbnail, int unreadMessagesCount)?
        groupConversation,
    required TResult orElse(),
  }) {
    if (groupConversation != null) {
      return groupConversation(conversation, lastMessage, displayName,
          thumbnail, unreadMessagesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ConversationItem value) $default, {
    required TResult Function(_GroupConversationItem value) groupConversation,
  }) {
    return groupConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
  }) {
    return groupConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ConversationItem value)? $default, {
    TResult Function(_GroupConversationItem value)? groupConversation,
    required TResult orElse(),
  }) {
    if (groupConversation != null) {
      return groupConversation(this);
    }
    return orElse();
  }
}

abstract class _GroupConversationItem implements ConversationItem {
  factory _GroupConversationItem(
      {required Conversation conversation,
      required ChatMessage lastMessage,
      required String displayName,
      String? thumbnail,
      required int unreadMessagesCount}) = _$_GroupConversationItem;

  @override
  Conversation get conversation;
  @override
  ChatMessage get lastMessage;
  @override
  String get displayName;
  String? get thumbnail;
  @override
  int get unreadMessagesCount;
  @override
  @JsonKey(ignore: true)
  _$GroupConversationItemCopyWith<_GroupConversationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
