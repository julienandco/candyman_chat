import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLatLngConverter implements JsonConverter<LatLng?, GeoPoint?> {
  const MyLatLngConverter();

  @override
  LatLng? fromJson(GeoPoint? json) {
    if (json == null) {
      return null;
    } else {
      return LatLng(json.latitude, json.longitude);
    }
  }

  @override
  GeoPoint? toJson(LatLng? object) {
    return object != null ? GeoPoint(object.latitude, object.longitude) : null;
  }
}
