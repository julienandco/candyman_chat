import 'chat_message.dart';

class ChatAudioMessage extends ChatMessage<String> {
  final int? durationInMilliseconds;

  const ChatAudioMessage({
    required String content,
    required DateTime sent,
    this.durationInMilliseconds,
  }) : super(
          content: content,
          sent: sent,
        );

  String get durationLabel {
    if (durationInMilliseconds == null) return '';
    final duration = Duration(milliseconds: durationInMilliseconds!);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds - minutes * 60;
    var result = '';
    if (minutes > 0) {
      result += '$minutes min';
      //TODO
      // result += '$minutes ${"min".tr()}';
    }
    if (seconds > 0) {
      if (result.isNotEmpty) result += ' ';
      result += '$seconds sec';
      //TODO
      // result += '$seconds ${"sec".tr()}';
    }
    return result;
  }
}
