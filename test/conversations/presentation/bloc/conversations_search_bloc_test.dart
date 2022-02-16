import 'package:bloc_test/bloc_test.dart';

//TODO: import
import 'package:neon_chat/src/conversations/presentation/bloc/conversations_search_bloc/conversations_search_bloc.dart';
//TODO

class MockConversationsSearchBloc
    extends MockBloc<ConversationsSearchEvent, ConversationsSearchState>
    implements ConversationsSearchBloc {}

final searchBloc = MockConversationsSearchBloc();

// whenListen(searchBloc, Stream.fromIterable([]), initialState: ConversationsSearchState.state(), );

//testen: nicht jedes event triggert neuen state!