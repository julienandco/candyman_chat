import 'package:test/test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:neon_chat/src/core/core.dart';

void main() {
  group('MyLatLngConverter', () {
    const converter = MyLatLngConverter();
    test('Empty JSON throws ArgumentError', () {
      expect(() => converter.fromJson({}), throwsArgumentError);
    });
    test('Faulty JSON (wrong key) throws ArgumentError', () {
      const faultyJson = {
        'lantitude': 12.3,
        'longitude': 34.4,
      };

      expect(() => converter.fromJson(faultyJson), throwsArgumentError);
    });
    test('Faulty JSON (missing key) throws ArgumentError', () {
      const faultyJson = {
        'latitude': 12.3,
      };

      expect(() => converter.fromJson(faultyJson), throwsArgumentError);
    });
    test('Valid fromJSON parsing', () {
      const testJson = {
        'latitude': 12.3,
        'longitude': 34.4,
      };

      const expectedLatLng = LatLng(12.3, 34.4);

      expect(converter.fromJson(testJson), expectedLatLng);
    });

    test('Valid toJSON parsing (null object)', () {
      expect(converter.toJson(null), {});
    });
    test('Valid toJSON parsing (non-null object)', () {
      const testLatLng = LatLng(12.3, 34.4);
      const expectedJson = {
        'latitude': 12.3,
        'longitude': 34.4,
      };

      expect(converter.toJson(testLatLng), expectedJson);
    });
  });
}
