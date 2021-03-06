// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_upload_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationUploadFileTearOff {
  const _$ConversationUploadFileTearOff();

  _ConversationUploadFile call(
      {required String messageId,
      required String conversationID,
      required String filePath,
      required ConversationUploadFileStatus status,
      int uploadProgress = 0,
      PlatformFile? platformFile}) {
    return _ConversationUploadFile(
      messageId: messageId,
      conversationID: conversationID,
      filePath: filePath,
      status: status,
      uploadProgress: uploadProgress,
      platformFile: platformFile,
    );
  }
}

/// @nodoc
const $ConversationUploadFile = _$ConversationUploadFileTearOff();

/// @nodoc
mixin _$ConversationUploadFile {
  String get messageId => throw _privateConstructorUsedError;
  String get conversationID => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  ConversationUploadFileStatus get status => throw _privateConstructorUsedError;
  int get uploadProgress => throw _privateConstructorUsedError;
  PlatformFile? get platformFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationUploadFileCopyWith<ConversationUploadFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationUploadFileCopyWith<$Res> {
  factory $ConversationUploadFileCopyWith(ConversationUploadFile value,
          $Res Function(ConversationUploadFile) then) =
      _$ConversationUploadFileCopyWithImpl<$Res>;
  $Res call(
      {String messageId,
      String conversationID,
      String filePath,
      ConversationUploadFileStatus status,
      int uploadProgress,
      PlatformFile? platformFile});
}

/// @nodoc
class _$ConversationUploadFileCopyWithImpl<$Res>
    implements $ConversationUploadFileCopyWith<$Res> {
  _$ConversationUploadFileCopyWithImpl(this._value, this._then);

  final ConversationUploadFile _value;
  // ignore: unused_field
  final $Res Function(ConversationUploadFile) _then;

  @override
  $Res call({
    Object? messageId = freezed,
    Object? conversationID = freezed,
    Object? filePath = freezed,
    Object? status = freezed,
    Object? uploadProgress = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_value.copyWith(
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationID: conversationID == freezed
          ? _value.conversationID
          : conversationID // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConversationUploadFileStatus,
      uploadProgress: uploadProgress == freezed
          ? _value.uploadProgress
          : uploadProgress // ignore: cast_nullable_to_non_nullable
              as int,
      platformFile: platformFile == freezed
          ? _value.platformFile
          : platformFile // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ));
  }
}

/// @nodoc
abstract class _$ConversationUploadFileCopyWith<$Res>
    implements $ConversationUploadFileCopyWith<$Res> {
  factory _$ConversationUploadFileCopyWith(_ConversationUploadFile value,
          $Res Function(_ConversationUploadFile) then) =
      __$ConversationUploadFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String messageId,
      String conversationID,
      String filePath,
      ConversationUploadFileStatus status,
      int uploadProgress,
      PlatformFile? platformFile});
}

/// @nodoc
class __$ConversationUploadFileCopyWithImpl<$Res>
    extends _$ConversationUploadFileCopyWithImpl<$Res>
    implements _$ConversationUploadFileCopyWith<$Res> {
  __$ConversationUploadFileCopyWithImpl(_ConversationUploadFile _value,
      $Res Function(_ConversationUploadFile) _then)
      : super(_value, (v) => _then(v as _ConversationUploadFile));

  @override
  _ConversationUploadFile get _value => super._value as _ConversationUploadFile;

  @override
  $Res call({
    Object? messageId = freezed,
    Object? conversationID = freezed,
    Object? filePath = freezed,
    Object? status = freezed,
    Object? uploadProgress = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_ConversationUploadFile(
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationID: conversationID == freezed
          ? _value.conversationID
          : conversationID // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConversationUploadFileStatus,
      uploadProgress: uploadProgress == freezed
          ? _value.uploadProgress
          : uploadProgress // ignore: cast_nullable_to_non_nullable
              as int,
      platformFile: platformFile == freezed
          ? _value.platformFile
          : platformFile // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
    ));
  }
}

/// @nodoc

class _$_ConversationUploadFile implements _ConversationUploadFile {
  _$_ConversationUploadFile(
      {required this.messageId,
      required this.conversationID,
      required this.filePath,
      required this.status,
      this.uploadProgress = 0,
      this.platformFile});

  @override
  final String messageId;
  @override
  final String conversationID;
  @override
  final String filePath;
  @override
  final ConversationUploadFileStatus status;
  @JsonKey()
  @override
  final int uploadProgress;
  @override
  final PlatformFile? platformFile;

  @override
  String toString() {
    return 'ConversationUploadFile(messageId: $messageId, conversationID: $conversationID, filePath: $filePath, status: $status, uploadProgress: $uploadProgress, platformFile: $platformFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationUploadFile &&
            const DeepCollectionEquality().equals(other.messageId, messageId) &&
            const DeepCollectionEquality()
                .equals(other.conversationID, conversationID) &&
            const DeepCollectionEquality().equals(other.filePath, filePath) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.uploadProgress, uploadProgress) &&
            const DeepCollectionEquality()
                .equals(other.platformFile, platformFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messageId),
      const DeepCollectionEquality().hash(conversationID),
      const DeepCollectionEquality().hash(filePath),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(uploadProgress),
      const DeepCollectionEquality().hash(platformFile));

  @JsonKey(ignore: true)
  @override
  _$ConversationUploadFileCopyWith<_ConversationUploadFile> get copyWith =>
      __$ConversationUploadFileCopyWithImpl<_ConversationUploadFile>(
          this, _$identity);
}

abstract class _ConversationUploadFile implements ConversationUploadFile {
  factory _ConversationUploadFile(
      {required String messageId,
      required String conversationID,
      required String filePath,
      required ConversationUploadFileStatus status,
      int uploadProgress,
      PlatformFile? platformFile}) = _$_ConversationUploadFile;

  @override
  String get messageId;
  @override
  String get conversationID;
  @override
  String get filePath;
  @override
  ConversationUploadFileStatus get status;
  @override
  int get uploadProgress;
  @override
  PlatformFile? get platformFile;
  @override
  @JsonKey(ignore: true)
  _$ConversationUploadFileCopyWith<_ConversationUploadFile> get copyWith =>
      throw _privateConstructorUsedError;
}
