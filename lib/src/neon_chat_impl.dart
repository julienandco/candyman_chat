part of neon_chat;

class NEONChat {
  NEONChat._();

  /// Initializes a new [FirebaseApp] instance by [name] and [options] and returns
  /// the created app. This method should be called before any usage of FlutterFire plugins.
  ///
  /// The default app instance cannot be initialized here and should be created
  /// using the platform Firebase integration.
  static Future<NEONChatApp> initializeApp({
    String? name,
    required NEONChatSetupOptions options,
    // FirebaseOptions? options,
  }) async {
    //TODO: was brauchen wir dafür?

    return NEONChatApp._(options);
  }

  //TODO: iwie so wie bei firebase: wir geben bei initialize eine ChatApp zurück, auf die
  // dann außerhalb des packages mit NEONChat.instance zugegriffen werden kann
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


