import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';

//TODO: needed? cannot find use of it in code anywhere...

abstract class ChatMessage<T> extends Equatable {
  final DateTime sent;
  final T content;

  const ChatMessage({
    required this.sent,
    required this.content,
  });

  @override
  List<Object?> get props => [
        sent,
        content,
      ];

  String get chatTimeText => DateFormat('HH:mm').format(sent);
}
