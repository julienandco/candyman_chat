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

const startDateKey = 'startDate';
const oneWayKey = 'mockID1Way';
final oneWayPlaceHolder = DateTime(1970, 01, 01);
const twoWayKey = 'mockID2Way';

final myNonNullableConverter =
    AdditionalConversationDataInfo<DateTime, Timestamp>(
  firebaseKey: startDateKey,
  fromJson: (json) => json.toDate(),
  toJson: (date) => Timestamp.fromDate(date),
);

class _StartDateAdditionalConversationData
    implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos =>
      [myNonNullableConverter];
}

final myOneWayNullableConverter =
    AdditionalConversationDataInfo<DateTime, Timestamp?>(
  firebaseKey: oneWayKey,
  fromJson: (json) => json == null ? oneWayPlaceHolder : json.toDate(),
  toJson: (date) => Timestamp.fromDate(date),
);

class _OneWayNullableIDAdditionalConversationData
    implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos =>
      [myOneWayNullableConverter];
}

final myTwoWayNullableConverter =
    AdditionalConversationDataInfo<DateTime?, Timestamp?>(
  firebaseKey: twoWayKey,
  fromJson: (json) => json?.toDate(),
  toJson: (date) => date == null ? null : Timestamp.fromDate(date),
);

class _TwoWayNullableIDAdditionalConversationData
    implements AdditionalConversationDataConfig {
  @override
  List<AdditionalConversationDataInfo> get additionalDataInfos =>
      [myTwoWayNullableConverter];
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

  group('Non-nullable additional field', () {
    final _customAdditionalData = _StartDateAdditionalConversationData();
    final additionalData = {startDateKey: _startDate};

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
      startDateKey: Timestamp.fromDate(_startDate),
    };

    final _jsonWithWrong = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      startDateKey: null,
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
  });

  group('One-way Nullable additional field', () {
    final _oneWayNullableAdditionalData =
        _OneWayNullableIDAdditionalConversationData();

    final additionalData = {oneWayKey: _startDate};
    final additionalDataPlaceholder = {oneWayKey: oneWayPlaceHolder};

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
    final _convoInfoWithPlaceholder = ConversationInfo(
      id: id,
      isGroupConversation: isGroupConversation,
      createdAt: createdAt,
      conversationMembers: conversationMembers,
      groupName: groupName,
      groupPicture: groupPicture,
      hiddenFrom: hiddenFrom,
      additionalData: additionalDataPlaceholder,
    );

    final _jsonWith = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      oneWayKey: Timestamp.fromDate(_startDate),
    };
    final _jsonWithNull = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      oneWayKey: null,
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
    final _jsonWithWrong = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      oneWayKey: false,
    };
    group('toJson', () {
      test(
          'Sets field in JSON if nullable additional data is given non-null value',
          () {
        final res = _convoInfo.toJsonTest(_oneWayNullableAdditionalData);
        expect(res, _jsonWith);
      });

      test('Does not set field in JSON if nullable additional data is null.',
          () {
        final res = _convoInfoWithout.toJsonTest(_oneWayNullableAdditionalData);
        expect(res, _jsonWithout);
      });
    });

    group('fromJson', () {
      test('Sets value of additional data to placeholder if null in JSON', () {
        final convoInfo = ConversationInfo.fromJsonTest(
            json: _jsonWithNull, convoData: _oneWayNullableAdditionalData);
        expect(convoInfo, _convoInfoWithPlaceholder);
      });
      test(
          'Sets value of additional data to placeholder if not existing in JSON',
          () {
        final convoInfo = ConversationInfo.fromJsonTest(
            json: _jsonWithout, convoData: _oneWayNullableAdditionalData);
        expect(convoInfo, _convoInfoWithPlaceholder);
      });

      test(
          'Throws WrongAdditionalDataInJson when additional data config is given, but wrong additional data stored in json',
          () {
        expect(
          () => ConversationInfo.fromJsonTest(
              json: _jsonWithWrong, convoData: _oneWayNullableAdditionalData),
          throwsA(
            predicate(
              (e) =>
                  e is WrongAdditionalDataInJson &&
                  e.message ==
                      'Wrong types in JSON! Expected an instance of Timestamp?, got bool instead.',
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
            json: _jsonWith, convoData: _oneWayNullableAdditionalData);
        expect(res, _convoInfo);
      });
      test(
          'Puts placeholder in datastructure if null stored as additional data',
          () {
        final res = ConversationInfo.fromJsonTest(
            json: _jsonWithNull, convoData: _oneWayNullableAdditionalData);
        expect(res, _convoInfoWithPlaceholder);
      });
      test(
          'Puts placeholder in datastructure if nothing stored as additional data',
          () {
        final res = ConversationInfo.fromJsonTest(
            json: _jsonWithout, convoData: _oneWayNullableAdditionalData);
        expect(res, _convoInfoWithPlaceholder);
      });
    });
  });

  group('Two-way Nullable additional field', () {
    final _twoWayNullableAdditionalData =
        _TwoWayNullableIDAdditionalConversationData();

    final additionalData = {twoWayKey: _startDate};
    final additionalDataPlaceholder = {twoWayKey: null};

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
    final _convoInfoWithPlaceholder = ConversationInfo(
      id: id,
      isGroupConversation: isGroupConversation,
      createdAt: createdAt,
      conversationMembers: conversationMembers,
      groupName: groupName,
      groupPicture: groupPicture,
      hiddenFrom: hiddenFrom,
      additionalData: additionalDataPlaceholder,
    );

    final _jsonWith = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      twoWayKey: Timestamp.fromDate(_startDate),
    };
    final _jsonWithNull = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      twoWayKey: null,
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
    final _jsonWithWrong = {
      'id': id,
      'isGroupConversation': isGroupConversation,
      'conversationMembers': conversationMembers,
      'groupName': groupName,
      'groupPicture': groupPicture,
      'createdAt': Timestamp.fromDate(createdAt),
      'hiddenFrom': hiddenFrom,
      twoWayKey: false,
    };
    group('toJson', () {
      test(
          'Sets field in JSON if nullable additional data is given non-null value',
          () {
        final res = _convoInfo.toJsonTest(_twoWayNullableAdditionalData);
        expect(res, _jsonWith);
      });

      test(
          'Does not set field in JSON when nullable additional data config is given, but nothing stored as additional data',
          () {
        final json =
            _convoInfoWithout.toJsonTest(_twoWayNullableAdditionalData);
        expect(json, _jsonWithout);
      });
      test(
          'Does not set field in JSON when nullable additional data config is given, but only null stored as additional data',
          () {
        final json =
            _convoInfoWithPlaceholder.toJsonTest(_twoWayNullableAdditionalData);
        expect(json, _jsonWithout);
      });
    });

    group('fromJson', () {
      test('Sets value of additional data to placeholder if null in JSON', () {
        final convoInfo = ConversationInfo.fromJsonTest(
            json: _jsonWithNull, convoData: _twoWayNullableAdditionalData);
        expect(convoInfo, _convoInfoWithPlaceholder);
      });
      test(
          'Sets value of additional data to placeholder if not existing in JSON',
          () {
        final convoInfo = ConversationInfo.fromJsonTest(
            json: _jsonWithout, convoData: _twoWayNullableAdditionalData);
        expect(convoInfo, _convoInfoWithPlaceholder);
      });

      test(
          'Throws WrongAdditionalDataInJson when additional data config is given, but wrong additional data stored in json',
          () {
        expect(
          () => ConversationInfo.fromJsonTest(
              json: _jsonWithWrong, convoData: _twoWayNullableAdditionalData),
          throwsA(
            predicate(
              (e) =>
                  e is WrongAdditionalDataInJson &&
                  e.message ==
                      'Wrong types in JSON! Expected an instance of Timestamp?, got bool instead.',
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
            json: _jsonWith, convoData: _twoWayNullableAdditionalData);
        expect(res, _convoInfo);
      });
    });
  });
}
