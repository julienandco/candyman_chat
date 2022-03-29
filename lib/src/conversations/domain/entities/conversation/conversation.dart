import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/core/data/models/my_datetime_converter.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const Conversation._();

  factory Conversation({
    required String id,
    String? displayName,
    required List<String> conversationMembers,
    String? thumbnail,
    @MyDateTimeConverter() DateTime? timestamp,
    @Default([]) List<String> hiddenFrom,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  //TODO: injection?
  /// return whether the conversation is hidden from the current user
  /// //TODO: add firebase rule such that hidden stuff does not even get sent back
  bool get isHidden => hiddenFrom.contains(
        FirebaseAuth.instance.currentUser!.uid,
        // (element) => element == getIt<FirebaseAuth>().currentUser!.uid,
      );

  bool get isGroupChat => conversationMembers.length > 2;
}
