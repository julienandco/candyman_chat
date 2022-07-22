// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_conversation_thumbnail_upload_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GroupConversationThumbnailUploadFileTearOff {
  const _$GroupConversationThumbnailUploadFileTearOff();

  _GroupConversationThumbnailUploadFile call(
      {required String groupConversationID,
      required String filePath,
      int uploadProgress = 0,
      PlatformFile? platformFile}) {
    return _GroupConversationThumbnailUploadFile(
      groupConversationID: groupConversationID,
      filePath: filePath,
      uploadProgress: uploadProgress,
      platformFile: platformFile,
    );
  }
}

/// @nodoc
const $GroupConversationThumbnailUploadFile =
    _$GroupConversationThumbnailUploadFileTearOff();

/// @nodoc
mixin _$GroupConversationThumbnailUploadFile {
  String get groupConversationID => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  int get uploadProgress => throw _privateConstructorUsedError;
  PlatformFile? get platformFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupConversationThumbnailUploadFileCopyWith<
          GroupConversationThumbnailUploadFile>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupConversationThumbnailUploadFileCopyWith<$Res> {
  factory $GroupConversationThumbnailUploadFileCopyWith(
          GroupConversationThumbnailUploadFile value,
          $Res Function(GroupConversationThumbnailUploadFile) then) =
      _$GroupConversationThumbnailUploadFileCopyWithImpl<$Res>;
  $Res call(
      {String groupConversationID,
      String filePath,
      int uploadProgress,
      PlatformFile? platformFile});
}

/// @nodoc
class _$GroupConversationThumbnailUploadFileCopyWithImpl<$Res>
    implements $GroupConversationThumbnailUploadFileCopyWith<$Res> {
  _$GroupConversationThumbnailUploadFileCopyWithImpl(this._value, this._then);

  final GroupConversationThumbnailUploadFile _value;
  // ignore: unused_field
  final $Res Function(GroupConversationThumbnailUploadFile) _then;

  @override
  $Res call({
    Object? groupConversationID = freezed,
    Object? filePath = freezed,
    Object? uploadProgress = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_value.copyWith(
      groupConversationID: groupConversationID == freezed
          ? _value.groupConversationID
          : groupConversationID // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$GroupConversationThumbnailUploadFileCopyWith<$Res>
    implements $GroupConversationThumbnailUploadFileCopyWith<$Res> {
  factory _$GroupConversationThumbnailUploadFileCopyWith(
          _GroupConversationThumbnailUploadFile value,
          $Res Function(_GroupConversationThumbnailUploadFile) then) =
      __$GroupConversationThumbnailUploadFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String groupConversationID,
      String filePath,
      int uploadProgress,
      PlatformFile? platformFile});
}

/// @nodoc
class __$GroupConversationThumbnailUploadFileCopyWithImpl<$Res>
    extends _$GroupConversationThumbnailUploadFileCopyWithImpl<$Res>
    implements _$GroupConversationThumbnailUploadFileCopyWith<$Res> {
  __$GroupConversationThumbnailUploadFileCopyWithImpl(
      _GroupConversationThumbnailUploadFile _value,
      $Res Function(_GroupConversationThumbnailUploadFile) _then)
      : super(_value, (v) => _then(v as _GroupConversationThumbnailUploadFile));

  @override
  _GroupConversationThumbnailUploadFile get _value =>
      super._value as _GroupConversationThumbnailUploadFile;

  @override
  $Res call({
    Object? groupConversationID = freezed,
    Object? filePath = freezed,
    Object? uploadProgress = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_GroupConversationThumbnailUploadFile(
      groupConversationID: groupConversationID == freezed
          ? _value.groupConversationID
          : groupConversationID // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_GroupConversationThumbnailUploadFile
    implements _GroupConversationThumbnailUploadFile {
  _$_GroupConversationThumbnailUploadFile(
      {required this.groupConversationID,
      required this.filePath,
      this.uploadProgress = 0,
      this.platformFile});

  @override
  final String groupConversationID;
  @override
  final String filePath;
  @JsonKey()
  @override
  final int uploadProgress;
  @override
  final PlatformFile? platformFile;

  @override
  String toString() {
    return 'GroupConversationThumbnailUploadFile(groupConversationID: $groupConversationID, filePath: $filePath, uploadProgress: $uploadProgress, platformFile: $platformFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupConversationThumbnailUploadFile &&
            const DeepCollectionEquality()
                .equals(other.groupConversationID, groupConversationID) &&
            const DeepCollectionEquality().equals(other.filePath, filePath) &&
            const DeepCollectionEquality()
                .equals(other.uploadProgress, uploadProgress) &&
            const DeepCollectionEquality()
                .equals(other.platformFile, platformFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupConversationID),
      const DeepCollectionEquality().hash(filePath),
      const DeepCollectionEquality().hash(uploadProgress),
      const DeepCollectionEquality().hash(platformFile));

  @JsonKey(ignore: true)
  @override
  _$GroupConversationThumbnailUploadFileCopyWith<
          _GroupConversationThumbnailUploadFile>
      get copyWith => __$GroupConversationThumbnailUploadFileCopyWithImpl<
          _GroupConversationThumbnailUploadFile>(this, _$identity);
}

abstract class _GroupConversationThumbnailUploadFile
    implements GroupConversationThumbnailUploadFile {
  factory _GroupConversationThumbnailUploadFile(
      {required String groupConversationID,
      required String filePath,
      int uploadProgress,
      PlatformFile? platformFile}) = _$_GroupConversationThumbnailUploadFile;

  @override
  String get groupConversationID;
  @override
  String get filePath;
  @override
  int get uploadProgress;
  @override
  PlatformFile? get platformFile;
  @override
  @JsonKey(ignore: true)
  _$GroupConversationThumbnailUploadFileCopyWith<
          _GroupConversationThumbnailUploadFile>
      get copyWith => throw _privateConstructorUsedError;
}
