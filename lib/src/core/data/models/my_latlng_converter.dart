import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLatLngConverter implements JsonConverter<LatLng?, Map<String, num>> {
  const MyLatLngConverter();

  static const latKey = 'latitude';
  static const longKey = 'longitude';

  @override
  fromJson(json) {
    if (json.containsKey(latKey) && json.containsKey(longKey)) {
      final lat = json[latKey] as double;
      final long = json[longKey] as double;

      return LatLng(lat, long);
    } else {
      throw ArgumentError();
    }
  }

  @override
  toJson(object) {
    if (object != null) {
      final lat = object.latitude;
      final long = object.longitude;

      return {
        latKey: lat,
        longKey: long,
      };
    } else {
      return {};
    }
  }
}
