import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:neon_chat/src/core/data/models/datetime_converters.dart';

class ConversationInfo extends Equatable {
  final String id;
  final bool isGroupConversation;
  final DateTime createdAt;

  ///
  /// Has two elements for a 1-on-1 conversation and n elements for a group
  /// conversation.
  ///
  final List<String> conversationMembers;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the name of the group
  /// conversation.
  ///
  final String? groupName;

  ///
  /// Is null for a 1-on-1 conversation and otherwise the upload id of the
  /// group conversation thumbnail
  ///
  final String? groupPicture;
  final List<String> hiddenFrom;

  ///
  /// If you want a conversation entity to have additional fields, pass your
  /// implementation of [AdditionalConversationDataConfig] into the chat, so that
  /// you can access it here. So for instance, if you wanted each of your
  /// [ConversationInfo] to also retrieve the field startDate from
  /// Firebase, which would be a Timestamp in Firebase and a DateTime in
  /// your Flutter app, your [AdditionalConversationDataConfig] would look like this:
  ///
  /// class StartDateAdditionalConversationData
  ///     implements AdditionalConversationData<DateTime, Timestamp> {
  ///   @override
  ///   Map<String, AdditionalConversationDataConverter<DateTime, Timestamp>>
  ///       get fieldNamesAndConverters => {
  ///             'startDate': StartDateConverter(),
  ///           };
  /// }
  ///
  /// class StartDateConverter
  ///     implements AdditionalConversationDataConverter<DateTime, Timestamp> {
  ///   @override
  ///   DateTime Function(dynamic json) get fromJson => (json) {
  ///         final tmp = json as Timestamp;
  ///         return tmp.toDate();
  ///       };
  ///
  ///   @override
  ///   Timestamp Function(dynamic date) get toJson => (date) {
  ///         return FieldValue.serverTimestamp();
  ///       };
  ///
  ///   @override
  ///   Type get backendType => Timestamp;
  ///
  ///   @override
  ///   Type get frontendType => DateTime;
  /// }
  ///
  final Map<String, dynamic>? additionalData;

  const ConversationInfo({
    required this.id,
    required this.isGroupConversation,
    required this.createdAt,
    required this.conversationMembers,
    this.groupName,
    this.groupPicture,
    this.hiddenFrom = const [],
    this.additionalData,
  });

  factory ConversationInfo.fromJson(Map<String, dynamic> json) {
    final bool isGroupConversation = json['isGroupConversation'] as bool;
    final additionalConvoDataConfig = isGroupConversation
        ? chatGetIt<FunctionInitData>().additionalGroupConversationData
        : chatGetIt<FunctionInitData>().additionalDirectConversationData;

    Map<String, dynamic>? additionalData = {};
    if (additionalConvoDataConfig != null) {
      for (var fieldName
          in additionalConvoDataConfig.fieldNamesAndConverters.keys) {
        if (!json.containsKey(fieldName)) {
          throw MissingAdditionalDataInJson();
        }

        final valueInJson = json[fieldName];

        final converter =
            additionalConvoDataConfig.fieldNamesAndConverters[fieldName];

        if (converter == null) {
          throw MissingConverter();
        }

        if (valueInJson.runtimeType != converter.backendType) {
          throw WrongAdditionalDataInJson(
              gotType: valueInJson.runtimeType,
              expectedType: converter.backendType);
        }

        final valueToJson = converter.fromJson(valueInJson);
        additionalData[fieldName] = valueToJson;
      }
    }

    return ConversationInfo(
      id: json['id'] as String,
      isGroupConversation: isGroupConversation,
      conversationMembers: (json['conversationMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      groupName: json['groupName'] as String?,
      groupPicture: json['groupPicture'] as String?,
      createdAt:
          const MyNonNullableDateTimeConverter().fromJson(json['createdAt']),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      additionalData: additionalData.keys.isEmpty ? null : additionalData,
    );
  }

  @visibleForTesting
  factory ConversationInfo.fromJsonTest(
      {required Map<String, dynamic> json,
      AdditionalConversationDataConfig? convoData}) {
    final bool isGroupConversation = json['isGroupConversation'] as bool;
    final additionalConvoDataConfig = convoData;

    Map<String, dynamic>? additionalData = {};
    if (additionalConvoDataConfig != null) {
      for (var fieldName
          in additionalConvoDataConfig.fieldNamesAndConverters.keys) {
        if (!json.containsKey(fieldName)) {
          throw MissingAdditionalDataInJson();
        }

        final valueInJson = json[fieldName];

        final converter =
            additionalConvoDataConfig.fieldNamesAndConverters[fieldName];

        if (converter == null) {
          throw MissingConverter();
        }

        if (valueInJson.runtimeType != converter.backendType) {
          throw WrongAdditionalDataInJson(
              gotType: valueInJson.runtimeType,
              expectedType: converter.backendType);
        }

        final valueToJson = converter.fromJson(valueInJson);
        additionalData[fieldName] = valueToJson;
      }
    }

    return ConversationInfo(
      id: json['id'] as String,
      isGroupConversation: isGroupConversation,
      conversationMembers: (json['conversationMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      groupName: json['groupName'] as String?,
      groupPicture: json['groupPicture'] as String?,
      createdAt:
          const MyNonNullableDateTimeConverter().fromJson(json['createdAt']),
      hiddenFrom: (json['hiddenFrom'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      additionalData: additionalData.keys.isEmpty ? null : additionalData,
    );
  }

  Map<String, dynamic> toJson() {
    final _additionalConvoData = isGroupConversation
        ? chatGetIt<FunctionInitData>().additionalGroupConversationData
        : chatGetIt<FunctionInitData>().additionalDirectConversationData;
    Map<String, dynamic> jsonMap = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
    };

    if (_additionalConvoData != null) {
      if (additionalData == null) {
        throw MissingAdditionalDataConfig();
      }

      for (var fieldName in _additionalConvoData.fieldNamesAndConverters.keys) {
        final fieldValue = additionalData![fieldName];

        final converter =
            _additionalConvoData.fieldNamesAndConverters[fieldName];
        if (converter == null) {
          throw MissingConverter();
        }
        try {
          final result = converter.toJson(fieldValue);
          jsonMap[fieldName] = result;
        } catch (e) {
          log(e.toString());
        }
      }
    }
    return jsonMap;
  }

  @visibleForTesting
  Map<String, dynamic> toJsonTest(
      [AdditionalConversationDataConfig? convoData]) {
    Map<String, dynamic> jsonMap = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
    };

    if (convoData != null) {
      final _additionalConvoData = convoData;

      if (additionalData == null) {
        throw MissingAdditionalDataConfig();
      }

      for (var fieldName in _additionalConvoData.fieldNamesAndConverters.keys) {
        final fieldValue = additionalData![fieldName];

        final converter =
            _additionalConvoData.fieldNamesAndConverters[fieldName];
        if (converter == null) {
          throw MissingConverter();
        }
        try {
          final result = converter.toJson(fieldValue);
          jsonMap[fieldName] = result;
        } catch (e) {
          log(e.toString());
        }
      }
    }
    return jsonMap;
  }

  @override
  List<Object?> get props => [
        id,
        isGroupConversation,
        createdAt,
        conversationMembers,
        groupName,
        groupPicture,
        hiddenFrom,
        additionalData,
      ];
}

class MissingAdditionalDataConfig extends Error {}

class MissingConverter extends Error {}

class MissingAdditionalDataInJson extends Error {}

class WrongAdditionalDataInJson extends Error {
  final Type gotType;
  final Type expectedType;

  WrongAdditionalDataInJson(
      {required this.gotType, required this.expectedType});

  String get message =>
      'Wrong types in JSON! Expected an instance of $expectedType, got $gotType instead.';
}

abstract class AdditionalConversationDataConfig<T, K> {
  final Map<String, AdditionalConversationDataConverter<T, K>>
      fieldNamesAndConverters;

  const AdditionalConversationDataConfig({
    required this.fieldNamesAndConverters,
  });
}

abstract class AdditionalConversationDataConverter<T, K> {
  final T Function(dynamic) fromJson;
  final K Function(dynamic) toJson;

  final Type frontendType;
  final Type backendType;

  const AdditionalConversationDataConverter({
    required this.fromJson,
    required this.toJson,
  })  : frontendType = T,
        backendType = K;
}
