// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Upload _$UploadFromJson(Map<String, dynamic> json) {
  return _Upload.fromJson(json);
}

/// @nodoc
class _$UploadTearOff {
  const _$UploadTearOff();

  _Upload call(
      {required String fileId, String? thumbnailId, String? thumnailMimeType}) {
    return _Upload(
      fileId: fileId,
      thumbnailId: thumbnailId,
      thumnailMimeType: thumnailMimeType,
    );
  }

  Upload fromJson(Map<String, Object?> json) {
    return Upload.fromJson(json);
  }
}

/// @nodoc
const $Upload = _$UploadTearOff();

/// @nodoc
mixin _$Upload {
  String get fileId => throw _privateConstructorUsedError;
  String? get thumbnailId => throw _privateConstructorUsedError;
  String? get thumnailMimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadCopyWith<Upload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadCopyWith<$Res> {
  factory $UploadCopyWith(Upload value, $Res Function(Upload) then) =
      _$UploadCopyWithImpl<$Res>;
  $Res call({String fileId, String? thumbnailId, String? thumnailMimeType});
}

/// @nodoc
class _$UploadCopyWithImpl<$Res> implements $UploadCopyWith<$Res> {
  _$UploadCopyWithImpl(this._value, this._then);

  final Upload _value;
  // ignore: unused_field
  final $Res Function(Upload) _then;

  @override
  $Res call({
    Object? fileId = freezed,
    Object? thumbnailId = freezed,
    Object? thumnailMimeType = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailId: thumbnailId == freezed
          ? _value.thumbnailId
          : thumbnailId // ignore: cast_nullable_to_non_nullable
              as String?,
      thumnailMimeType: thumnailMimeType == freezed
          ? _value.thumnailMimeType
          : thumnailMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UploadCopyWith<$Res> implements $UploadCopyWith<$Res> {
  factory _$UploadCopyWith(_Upload value, $Res Function(_Upload) then) =
      __$UploadCopyWithImpl<$Res>;
  @override
  $Res call({String fileId, String? thumbnailId, String? thumnailMimeType});
}

/// @nodoc
class __$UploadCopyWithImpl<$Res> extends _$UploadCopyWithImpl<$Res>
    implements _$UploadCopyWith<$Res> {
  __$UploadCopyWithImpl(_Upload _value, $Res Function(_Upload) _then)
      : super(_value, (v) => _then(v as _Upload));

  @override
  _Upload get _value => super._value as _Upload;

  @override
  $Res call({
    Object? fileId = freezed,
    Object? thumbnailId = freezed,
    Object? thumnailMimeType = freezed,
  }) {
    return _then(_Upload(
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailId: thumbnailId == freezed
          ? _value.thumbnailId
          : thumbnailId // ignore: cast_nullable_to_non_nullable
              as String?,
      thumnailMimeType: thumnailMimeType == freezed
          ? _value.thumnailMimeType
          : thumnailMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Upload implements _Upload {
  _$_Upload({required this.fileId, this.thumbnailId, this.thumnailMimeType});

  factory _$_Upload.fromJson(Map<String, dynamic> json) =>
      _$$_UploadFromJson(json);

  @override
  final String fileId;
  @override
  final String? thumbnailId;
  @override
  final String? thumnailMimeType;

  @override
  String toString() {
    return 'Upload(fileId: $fileId, thumbnailId: $thumbnailId, thumnailMimeType: $thumnailMimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Upload &&
            const DeepCollectionEquality().equals(other.fileId, fileId) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailId, thumbnailId) &&
            const DeepCollectionEquality()
                .equals(other.thumnailMimeType, thumnailMimeType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fileId),
      const DeepCollectionEquality().hash(thumbnailId),
      const DeepCollectionEquality().hash(thumnailMimeType));

  @JsonKey(ignore: true)
  @override
  _$UploadCopyWith<_Upload> get copyWith =>
      __$UploadCopyWithImpl<_Upload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadToJson(this);
  }
}

abstract class _Upload implements Upload {
  factory _Upload(
      {required String fileId,
      String? thumbnailId,
      String? thumnailMimeType}) = _$_Upload;

  factory _Upload.fromJson(Map<String, dynamic> json) = _$_Upload.fromJson;

  @override
  String get fileId;
  @override
  String? get thumbnailId;
  @override
  String? get thumnailMimeType;
  @override
  @JsonKey(ignore: true)
  _$UploadCopyWith<_Upload> get copyWith => throw _privateConstructorUsedError;
}
