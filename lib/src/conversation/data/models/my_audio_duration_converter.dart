import 'package:json_annotation/json_annotation.dart';

class MyAudioDurationConverter implements JsonConverter<Duration?, int?> {
  const MyAudioDurationConverter();

  @override
  Duration? fromJson(int? json) {
    return json != null ? Duration(seconds: json) : null;
  }

  @override
  int? toJson(Duration? object) {
    return object?.inSeconds;
  }
}
