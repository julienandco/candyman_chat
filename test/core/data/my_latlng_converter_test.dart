import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:neon_chat/src/core/core.dart';

void main() {
  group('MyLatLngConverter', () {
    const converter = MyLatLngConverter();
    test('Valid fromJSON parsing (null)', () {
      expect(converter.fromJson(null), null);
    });
    test('Valid fromJSON parsing (non-null)', () {
      const input = GeoPoint(12.3, 34.4);

      const expectedLatLng = LatLng(12.3, 34.4);

      expect(converter.fromJson(input), expectedLatLng);
    });

    test('Valid toJSON parsing (null object)', () {
      expect(converter.toJson(null), null);
    });
    test('Valid toJSON parsing (non-null object)', () {
      const testLatLng = LatLng(12.3, 34.4);
      const expected = GeoPoint(12.3, 34.4);

      expect(converter.toJson(testLatLng), expected);
    });
  });
}
