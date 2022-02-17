part of neon_chat;

class NEONChatNotInitializedError extends Error {}

class NEONChat {
  NEONChat._();

  static ChatBloc? _chatBloc;
  static ChatSearchBloc? _chatSearchBloc;
  static ConversationsBloc? _conversationsBloc;
  static ConversationsSearchBloc? _conversationsSearchBloc;

  /// Initializes a new [FirebaseApp] instance by [name] and [options] and returns
  /// the created app. This method should be called before any usage of FlutterFire plugins.
  ///
  /// The default app instance cannot be initialized here and should be created
  /// using the platform Firebase integration.
  static void initializeApp({
    String? name,
    required NEONChatSetupOptions options,
    // FirebaseOptions? options,
  }) async {
    //TODO: was brauchen wir dafür?
  }

  static ChatBloc get chatBloc {
    if (_chatBloc != null) {
      return _chatBloc!;
    } else {
      throw NEONChatNotInitializedError();
    }
  }

  static ChatSearchBloc get chatSearchBloc {
    if (_chatSearchBloc != null) {
      return _chatSearchBloc!;
    } else {
      throw NEONChatNotInitializedError();
    }
  }

  static ConversationsBloc get conversationsBloc {
    if (_conversationsBloc != null) {
      return _conversationsBloc!;
    } else {
      throw NEONChatNotInitializedError();
    }
  }

  static ConversationsSearchBloc get conversationsSearchBloc {
    if (_conversationsSearchBloc != null) {
      return _conversationsSearchBloc!;
    } else {
      throw NEONChatNotInitializedError();
    }
  }
}



 





  /// Returns a [FirebaseApp] instance.
  ///
  /// If no name is provided, the default app instance is returned.
  /// Throws if the app does not exist.
  // static FirebaseApp app([String name = defaultFirebaseAppName]) {
  //   FirebaseAppPlatform app = _delegate.app(name);

  //   return FirebaseApp._(app);
  // }

  // TODO(rrousselGit): remove ==/hashCode
  // @override
  // // ignore: avoid_equals_and_hash_code_on_mutable_classes
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   if (other is! Firebase) return false;
  //   return other.hashCode == hashCode;
  // }

  // @override
  // // ignore: avoid_equals_and_hash_code_on_mutable_classes
  // int get hashCode => toString().hashCode;

  // @override
  // String toString() => '$Firebase';


