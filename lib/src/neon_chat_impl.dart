part of neon_chat;

class NEONChatNotInitializedError extends Error {}

class NEONChatAlreadyInitializedError extends Error {}

class NEONChat {
  NEONChat._();

  // static ChatBloc? _chatBloc;
  // static ChatSearchBloc? _chatSearchBloc;
  static ConversationsBloc? _conversationsBloc;
  // static ConversationsSearchBloc? _conversationsSearchBloc;

  static FirebaseAuth? _firebaseAuth;
  static ChatRepositoryImpl? _chatRepo;
  static ConversationRepositoryImpl? _conversationRepo;
  static ChatUploadManagerRepositoryImpl? _chatUploadRepo;
  static FirebaseUserProfileRepositoryImpl? _userProfileRepo;

  static bool _isInit = false;

  static void initializeChat({
    required NEONChatSetupOptions options,
  }) {
    if (!_isInit) {
      _isInit = true;

      _chatRepo = ChatRepositoryImpl(options.firestore, options.firebaseAuth);
      final fileUploadRepoImpl = FileUploadRepositoryImpl(
        options.deleteEndpoint,
        options.patchEndpoint,
        options.postEndpoint,
        options.getEndpoint,
        options.uploadFileToPresignedURL,
      );

      _chatUploadRepo = ChatUploadManagerRepositoryImpl(
          fileUploadRepository: fileUploadRepoImpl);

      _conversationRepo =
          ConversationRepositoryImpl(options.firestore, options.firebaseAuth);

      _userProfileRepo = FirebaseUserProfileRepositoryImpl();

      _conversationsBloc =
          ConversationsBloc(_conversationRepo!, _userProfileRepo!, _chatRepo!);
    } else {
      throw NEONChatAlreadyInitializedError();
    }
  }

  static ChatBloc getChatBloc({
    required String conversationId,
    required String userProfileId,
  }) {
    if (_isInit) {
      //TODO: meherere instanzen kein problem, in papeo auch so gemacht, nur auth udn repos etc müssen singletons sein
      return ChatBloc(
        conversationId: conversationId,
        userProfileId: userProfileId,
        firebaseAuth: _firebaseAuth!,
        chatRepository: _chatRepo!,
        conversationRepository: _conversationRepo!,
        chatUploadManagerRepository: _chatUploadRepo!,
        userProfileRepository: _userProfileRepo!,
      );
    } else {
      throw NEONChatNotInitializedError();
    }
  }

//TODO: nötig? in papeo wird für jeden chat neuer instanziiert (ohne getit)
  static ChatSearchBloc get chatSearchBloc {
    // if (_chatSearchBloc != null) {
    //   return _chatSearchBloc!;
    // } else {
    //   throw NEONChatNotInitializedError();
    // }
    return ChatSearchBloc();
  }

  //in papeo kein singleton, aber auf app niveau in provider geklemmt also iwie doch singleton
  static ConversationsBloc get conversationsBloc {
    if (_conversationsBloc != null) {
      return _conversationsBloc!;
    } else {
      throw NEONChatNotInitializedError();
    }
  }

  //TODO: nötig? wird auch für jeden aufruf des convoLoaders neu instanziiert
  static ConversationsSearchBloc get conversationsSearchBloc {
    // if (_conversationsSearchBloc != null) {
    //   return _conversationsSearchBloc!;
    // } else {
    //   throw NEONChatNotInitializedError();
    // }
    return ConversationsSearchBloc();
  }
}
