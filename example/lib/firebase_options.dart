// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAj8vt6iRoQm0amrJaA3Y9c9tJaOajeh2M',
    appId: '1:1020559292217:web:5f6be00224cf01db659ae8',
    messagingSenderId: '1020559292217',
    projectId: 'neon-chat-example',
    authDomain: 'neon-chat-example.firebaseapp.com',
    storageBucket: 'neon-chat-example.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqW73SvGPOjmDDzHE_8-nk1qoBzxXOHrg',
    appId: '1:1020559292217:android:9fe5968efb885487659ae8',
    messagingSenderId: '1020559292217',
    projectId: 'neon-chat-example',
    storageBucket: 'neon-chat-example.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyMBRr-xldrsR0zJ_bRCLcUsDlUhSnHpg',
    appId: '1:1020559292217:ios:82f482c24e1c2d35659ae8',
    messagingSenderId: '1020559292217',
    projectId: 'neon-chat-example',
    storageBucket: 'neon-chat-example.appspot.com',
    iosClientId: '1020559292217-7slubv6fdpgc6tbfo68kc8bo5mssoiov.apps.googleusercontent.com',
    iosBundleId: 'com.neon.chatExample',
  );
}