import 'package:test/test.dart';

import 'package:neon_chat/src/core/core.dart';

void main() {
  group('FirebaseUser', () {
    const testId = 'test-id';
    const testName = 'test-name';
    test('toJson', () {
      final expectedJson = {
        'id': testId,
        'name': testName,
      };

      final user = FirebaseUser(id: testId, name: testName);
      expect(user.toJson(), expectedJson);
    });
    test('fromJson', () {
      final expectedUser = FirebaseUser(id: testId, name: testName);

      final json = {
        'id': testId,
        'name': testName,
      };

      expect(FirebaseUser.fromJson(json), expectedUser);
    });
  });
}
