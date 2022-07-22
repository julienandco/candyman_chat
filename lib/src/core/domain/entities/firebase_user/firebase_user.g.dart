// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseUser _$$_FirebaseUserFromJson(Map<String, dynamic> json) =>
    _$_FirebaseUser(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePictureURL: json['profilePictureURL'] as String?,
      lastActivity: const MyDateTimeConverter().fromJson(json['lastActivity']),
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedByUsers: (json['blockedByUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FirebaseUserToJson(_$_FirebaseUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profilePictureURL': instance.profilePictureURL,
      'lastActivity': const MyDateTimeConverter().toJson(instance.lastActivity),
      'blockedUsers': instance.blockedUsers,
      'blockedByUsers': instance.blockedByUsers,
    };
