// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neon_chat/src/conversations/domain/domain.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final myConverter = _StartDateConverter();

class _StartDateAdditionalConversationData
    implements AdditionalConversationDataConfig<DateTime, Timestamp> {
  @override
  Map<String, AdditionalConversationDataConverter<DateTime, Timestamp>>
      get fieldNamesAndConverters => {
            'startDate': myConverter,
          };
}

class _StartDateConverter
    implements AdditionalConversationDataConverter<DateTime, Timestamp> {
  @override
  DateTime Function(dynamic json) get fromJson => (json) {
        final tmp = json as dynamic;
        return tmp.toDate();
      };

  @override
  Timestamp Function(dynamic date) get toJson => (date) {
        return Timestamp.fromDate(date);
      };

  @override
  Type get backendType => Timestamp;

  @override
  Type get frontendType => DateTime;
}

void main() {
  const id = 'id';
  const isGroupConversation = true;
  final conversationMembers = ['1', '2', '3'];
  const groupName = 'groupName';
  const groupPicture = 'groupPicture.jpeg';
  final createdAt = DateTime(2022, 06, 28, 15, 00);
  final hiddenFrom = <String>[];
  final _startDate = DateTime(2022, 07, 28, 15, 00);
  final additionalData = {'startDate': _startDate};

  final _convoInfo = ConversationInfo(
    id: id,
    isGroupConversation: isGroupConversation,
    createdAt: createdAt,
    conversationMembers: conversationMembers,
    groupName: groupName,
    groupPicture: groupPicture,
    hiddenFrom: hiddenFrom,
    additionalData: additionalData,
  );

  final _convoInfoWithout = ConversationInfo(
    id: id,
    isGroupConversation: isGroupConversation,
    createdAt: createdAt,
    conversationMembers: conversationMembers,
    groupName: groupName,
    groupPicture: groupPicture,
    hiddenFrom: hiddenFrom,
  );

  final _jsonWith = {
    'id': id,
    'isGroupConversation': isGroupConversation,
    'conversationMembers': conversationMembers,
    'groupName': groupName,
    'groupPicture': groupPicture,
    'createdAt': Timestamp.fromDate(createdAt),
    'hiddenFrom': hiddenFrom,
    'startDate': Timestamp.fromDate(_startDate),
  };

  final _jsonWithWrong = {
    'id': id,
    'isGroupConversation': isGroupConversation,
    'conversationMembers': conversationMembers,
    'groupName': groupName,
    'groupPicture': groupPicture,
    'createdAt': Timestamp.fromDate(createdAt),
    'hiddenFrom': hiddenFrom,
    'startDate': null,
  };

  final _jsonWithout = {
    'id': id,
    'isGroupConversation': isGroupConversation,
    'conversationMembers': conversationMembers,
    'groupName': groupName,
    'groupPicture': groupPicture,
    'createdAt': Timestamp.fromDate(createdAt),
    'hiddenFrom': hiddenFrom,
  };

  final _customAdditionalData = _StartDateAdditionalConversationData();

  group('toJson', () {
    test(
        'Throws MissingAdditionalData when additional data config is given, but no additional data stored',
        () {
      expect(() => _convoInfoWithout.toJsonTest(_customAdditionalData),
          throwsA(const TypeMatcher<MissingAdditionalDataConfig>()));
    });

    test('Correct toJson parsing without additional data', () {
      final res = _convoInfoWithout.toJsonTest();
      expect(res, _jsonWithout);
    });
    test('Correct toJson parsing with additional data', () {
      final res = _convoInfo.toJsonTest(_customAdditionalData);
      expect(res, _jsonWith);
    });
  });
  group('fromJson', () {
    test(
        'Throws MissingAdditionalDataInJson when additional data config is given, but no additional data stored in json',
        () {
      expect(
          () => ConversationInfo.fromJsonTest(
              json: _jsonWithout, convoData: _customAdditionalData),
          throwsA(const TypeMatcher<MissingAdditionalDataInJson>()));
    });

    test(
        'Throws WrongAdditionalDataInJson when additional data config is given, but wrong additional data stored in json',
        () {
      expect(
        () => ConversationInfo.fromJsonTest(
            json: _jsonWithWrong, convoData: _customAdditionalData),
        throwsA(
          predicate(
            (e) =>
                e is WrongAdditionalDataInJson &&
                e.message ==
                    'Wrong types in JSON! Expected an instance of Timestamp, got Null instead.',
          ),
        ),
      );
    });
    test('Correct fromJson parsing without additional data', () {
      final res = ConversationInfo.fromJsonTest(json: _jsonWithout);
      expect(res, _convoInfoWithout);
    });
    test('Correct fromJson parsing with additional data', () {
      final res = ConversationInfo.fromJsonTest(
          json: _jsonWith, convoData: _customAdditionalData);
      expect(res, _convoInfo);
    });
  });
}
