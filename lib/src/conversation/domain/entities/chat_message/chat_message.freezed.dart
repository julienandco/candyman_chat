// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
class _$ChatMessageTearOff {
  const _$ChatMessageTearOff();

  _ChatMessage call(
      {String id = '',
      String? text,
      @MyLatLngConverter() LatLng? location,
      bool seen = false,
      required String senderId,
      @MyDateTimeConverter() DateTime? timestamp,
      Upload? upload,
      @MyChatMessageTypeConverter() required ChatMessageType type,
      bool doneUpload = false,
      String? filePath,
      @MyAudioDurationConverter() Duration? audioDuration,
      List<String> hiddenFrom = const []}) {
    return _ChatMessage(
      id: id,
      text: text,
      location: location,
      seen: seen,
      senderId: senderId,
      timestamp: timestamp,
      upload: upload,
      type: type,
      doneUpload: doneUpload,
      filePath: filePath,
      audioDuration: audioDuration,
      hiddenFrom: hiddenFrom,
    );
  }

  ChatMessage fromJson(Map<String, Object?> json) {
    return ChatMessage.fromJson(json);
  }
}

/// @nodoc
const $ChatMessage = _$ChatMessageTearOff();

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @MyLatLngConverter()
  LatLng? get location => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  @MyDateTimeConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  Upload? get upload => throw _privateConstructorUsedError;
  @MyChatMessageTypeConverter()
  ChatMessageType get type => throw _privateConstructorUsedError;
  bool get doneUpload => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  @MyAudioDurationConverter()
  Duration? get audioDuration => throw _privateConstructorUsedError;
  List<String> get hiddenFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? text,
      @MyLatLngConverter() LatLng? location,
      bool seen,
      String senderId,
      @MyDateTimeConverter() DateTime? timestamp,
      Upload? upload,
      @MyChatMessageTypeConverter() ChatMessageType type,
      bool doneUpload,
      String? filePath,
      @MyAudioDurationConverter() Duration? audioDuration,
      List<String> hiddenFrom});

  $UploadCopyWith<$Res>? get upload;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res> implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  final ChatMessage _value;
  // ignore: unused_field
  final $Res Function(ChatMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? location = freezed,
    Object? seen = freezed,
    Object? senderId = freezed,
    Object? timestamp = freezed,
    Object? upload = freezed,
    Object? type = freezed,
    Object? doneUpload = freezed,
    Object? filePath = freezed,
    Object? audioDuration = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      upload: upload == freezed
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as Upload?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatMessageType,
      doneUpload: doneUpload == freezed
          ? _value.doneUpload
          : doneUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      audioDuration: audioDuration == freezed
          ? _value.audioDuration
          : audioDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      hiddenFrom: hiddenFrom == freezed
          ? _value.hiddenFrom
          : hiddenFrom // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $UploadCopyWith<$Res>? get upload {
    if (_value.upload == null) {
      return null;
    }

    return $UploadCopyWith<$Res>(_value.upload!, (value) {
      return _then(_value.copyWith(upload: value));
    });
  }
}

/// @nodoc
abstract class _$ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(
          _ChatMessage value, $Res Function(_ChatMessage) then) =
      __$ChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? text,
      @MyLatLngConverter() LatLng? location,
      bool seen,
      String senderId,
      @MyDateTimeConverter() DateTime? timestamp,
      Upload? upload,
      @MyChatMessageTypeConverter() ChatMessageType type,
      bool doneUpload,
      String? filePath,
      @MyAudioDurationConverter() Duration? audioDuration,
      List<String> hiddenFrom});

  @override
  $UploadCopyWith<$Res>? get upload;
}

/// @nodoc
class __$ChatMessageCopyWithImpl<$Res> extends _$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(
      _ChatMessage _value, $Res Function(_ChatMessage) _then)
      : super(_value, (v) => _then(v as _ChatMessage));

  @override
  _ChatMessage get _value => super._value as _ChatMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? location = freezed,
    Object? seen = freezed,
    Object? senderId = freezed,
    Object? timestamp = freezed,
    Object? upload = freezed,
    Object? type = freezed,
    Object? doneUpload = freezed,
    Object? filePath = freezed,
    Object? audioDuration = freezed,
    Object? hiddenFrom = freezed,
  }) {
    return _then(_ChatMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      upload: upload == freezed
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as Upload?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChatMessageType,
      doneUpload: doneUpload == freezed
          ? _value.doneUpload
          : doneUpload // ignore: cast_nullable_to_non_nullable
              as bool,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      audioDuration: audioDuration == freezed
          ? _value.audioDuration
          : audioDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      hiddenFrom: hiddenFrom == freezed
          ? _value.hiddenFrom
          : hiddenFrom // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessage extends _ChatMessage {
  _$_ChatMessage(
      {this.id = '',
      this.text,
      @MyLatLngConverter() this.location,
      this.seen = false,
      required this.senderId,
      @MyDateTimeConverter() this.timestamp,
      this.upload,
      @MyChatMessageTypeConverter() required this.type,
      this.doneUpload = false,
      this.filePath,
      @MyAudioDurationConverter() this.audioDuration,
      this.hiddenFrom = const []})
      : super._();

  factory _$_ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageFromJson(json);

  @JsonKey()
  @override
  final String id;
  @override
  final String? text;
  @override
  @MyLatLngConverter()
  final LatLng? location;
  @JsonKey()
  @override
  final bool seen;
  @override
  final String senderId;
  @override
  @MyDateTimeConverter()
  final DateTime? timestamp;
  @override
  final Upload? upload;
  @override
  @MyChatMessageTypeConverter()
  final ChatMessageType type;
  @JsonKey()
  @override
  final bool doneUpload;
  @override
  final String? filePath;
  @override
  @MyAudioDurationConverter()
  final Duration? audioDuration;
  @JsonKey()
  @override
  final List<String> hiddenFrom;

  @override
  String toString() {
    return 'ChatMessage(id: $id, text: $text, location: $location, seen: $seen, senderId: $senderId, timestamp: $timestamp, upload: $upload, type: $type, doneUpload: $doneUpload, filePath: $filePath, audioDuration: $audioDuration, hiddenFrom: $hiddenFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.seen, seen) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.upload, upload) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.doneUpload, doneUpload) &&
            const DeepCollectionEquality().equals(other.filePath, filePath) &&
            const DeepCollectionEquality()
                .equals(other.audioDuration, audioDuration) &&
            const DeepCollectionEquality()
                .equals(other.hiddenFrom, hiddenFrom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(seen),
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(upload),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(doneUpload),
      const DeepCollectionEquality().hash(filePath),
      const DeepCollectionEquality().hash(audioDuration),
      const DeepCollectionEquality().hash(hiddenFrom));

  @JsonKey(ignore: true)
  @override
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageToJson(this);
  }
}

abstract class _ChatMessage extends ChatMessage {
  factory _ChatMessage(
      {String id,
      String? text,
      @MyLatLngConverter() LatLng? location,
      bool seen,
      required String senderId,
      @MyDateTimeConverter() DateTime? timestamp,
      Upload? upload,
      @MyChatMessageTypeConverter() required ChatMessageType type,
      bool doneUpload,
      String? filePath,
      @MyAudioDurationConverter() Duration? audioDuration,
      List<String> hiddenFrom}) = _$_ChatMessage;
  _ChatMessage._() : super._();

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$_ChatMessage.fromJson;

  @override
  String get id;
  @override
  String? get text;
  @override
  @MyLatLngConverter()
  LatLng? get location;
  @override
  bool get seen;
  @override
  String get senderId;
  @override
  @MyDateTimeConverter()
  DateTime? get timestamp;
  @override
  Upload? get upload;
  @override
  @MyChatMessageTypeConverter()
  ChatMessageType get type;
  @override
  bool get doneUpload;
  @override
  String? get filePath;
  @override
  @MyAudioDurationConverter()
  Duration? get audioDuration;
  @override
  List<String> get hiddenFrom;
  @override
  @JsonKey(ignore: true)
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
