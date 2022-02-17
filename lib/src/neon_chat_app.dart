part of neon_chat;

/// Represents a single NEON Chat app instance.
///
/// You can get an instance by calling [NEONChat.app()].
class NEONChatApp {
  /// A [NEONChatApp] instance can only be accessed from a call to `app()` on
  /// [NEONChat].
  ///
  /// This constructor ensures that the delegate instance it is
  /// constructed with is one which extends [FirebaseAppPlatform].
  NEONChatApp._(this._chatSetupOptions) {
    //TODO: do shit je nachdem was in den setup options steht
    // FirebaseAppPlatform.verifyExtends(_delegate);
  }

  // final FirebaseAppPlatform _delegate;
  final NEONChatSetupOptions _chatSetupOptions;

  /// Deletes this app and frees up system resources.
  ///
  /// Once deleted, any plugin functionality using this app instance will throw
  /// an error.
  Future<void> delete() async {
    await _delegate.delete();
  }

  /// The name of this [FirebaseApp].
  String get name => _delegate.name;

  /// The [FirebaseOptions] this app was created with.
  FirebaseOptions get options => _delegate.options;

  /// Returns whether automatic data collection is enabled or disabled for this
  /// app.
  ///
  /// Automatic data collection can be enabled or disabled via `setAutomaticDataCollectionEnabled`.
  bool get isAutomaticDataCollectionEnabled =>
      _delegate.isAutomaticDataCollectionEnabled;

  /// Sets whether automatic data collection is enabled or disabled for this
  /// app.
  ///
  /// To check whether it is currently enabled or not, call [isAutomaticDataCollectionEnabled].
  Future<void> setAutomaticDataCollectionEnabled(bool enabled) {
    return _delegate.setAutomaticDataCollectionEnabled(enabled);
  }

  /// Sets whether automatic resource management is enabled or disabled for this
  /// app.
  Future<void> setAutomaticResourceManagementEnabled(bool enabled) {
    return _delegate.setAutomaticResourceManagementEnabled(enabled);
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NEONChatApp) return false;
    return other.name == name && other.options == options;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => hashValues(name, options);

  @override
  String toString() => '$NEONChatApp($name)';
}
