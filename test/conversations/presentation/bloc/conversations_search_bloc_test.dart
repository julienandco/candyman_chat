import 'package:bloc_test/bloc_test.dart';
import 'package:neon_chat/src/conversations/domain/entities/conversation/conversation.dart';
import 'package:neon_chat/src/conversations/domain/entities/conversation_item/conversation_item.dart';

//TODO: import
import 'package:neon_chat/src/conversations/presentation/bloc/conversations_search_bloc/conversations_search_bloc.dart';
import 'package:neon_chat/src/core/domain/entities/firebase_user/firebase_user.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class MockConversationsSearchBloc
    extends MockBloc<ConversationsSearchEvent, ConversationsSearchState>
    implements ConversationsSearchBloc {}

void main() {
  group('ConversationsSearchBloc', () {
    final searchBloc = MockConversationsSearchBloc();

    final mockConversation =
        Conversation(id: 'convo-id', conversationMembers: ['1', '2']);

    final mockName = 'testo';

    final mockPartner = FirebaseUser(
      id: '2',
      name: mockName,
    );

    final mockConversations = [
      ConversationItem(
        conversation: mockConversation,
        conversationPartner: mockPartner,
        unreadMessagesCount: 2,
      ),
    ];

    whenListen(
      searchBloc,
      Stream.fromIterable(
          [const ConversationsSearchState.state(conversations: [])]),
      initialState: const ConversationsSearchState.state(conversations: []),
    );

    test('initial state has empty list', () {
      expect(searchBloc.state,
          const ConversationsSearchState.state(conversations: []));
    });

    test('_conversations is initially empty', () {
      expect(searchBloc.conversations, []);
    });

    blocTest<ConversationsSearchBloc, ConversationsSearchState>(
      'emits [] when nothing is added.',
      build: () => ConversationsSearchBloc(),
      expect: () => [],
    );

    blocTest<ConversationsSearchBloc, ConversationsSearchState>(
      'emits [] when setEntries is added.',
      build: () => ConversationsSearchBloc(),
      act: (bloc) =>
          bloc.add(ConversationsSearchEvent.setEntries(mockConversations)),
      expect: () => [],
    );
    test('_conversations is changed when setEntries is added', () {
      searchBloc.add(ConversationsSearchEvent.setEntries(mockConversations));
      expect(searchBloc.conversations, mockConversations);
    });

    blocTest<ConversationsSearchBloc, ConversationsSearchState>(
      'emits active state with results when query is added with result-bringing searchString.',
      setUp: () => searchBloc
          .add(ConversationsSearchEvent.setEntries(mockConversations)),
      build: () => searchBloc,
      act: (_) =>
          searchBloc.add(ConversationsSearchEvent.query(mockName.substring(2))),
      expect: () => ConversationsSearchState.state(
        conversations: mockConversations,
        isSearchActive: true,
      ),
    );
    blocTest<ConversationsSearchBloc, ConversationsSearchState>(
      'emits active state with empty list when query is added with no-result-bringing searchString.',
      setUp: () => searchBloc
          .add(ConversationsSearchEvent.setEntries(mockConversations)),
      build: () => searchBloc,
      act: (bloc) => bloc.add(const ConversationsSearchEvent.query('psdfs')),
      expect: () => const ConversationsSearchState.state(
        conversations: [],
        isSearchActive: true,
      ),
    );
    blocTest<ConversationsSearchBloc, ConversationsSearchState>(
      'emits active state with given list when onResult is added.',
      build: () => ConversationsSearchBloc(),
      act: (bloc) =>
          bloc.add(ConversationsSearchEvent.onResult(mockConversations)),
      expect: () => ConversationsSearchState.state(
        conversations: mockConversations,
        isSearchActive: true,
      ),
    );
  });
}
