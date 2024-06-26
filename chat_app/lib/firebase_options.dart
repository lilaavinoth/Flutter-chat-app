// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCBbMmskTCKRcbz7XRAQv76RfV3bnv_CZ0',
    appId: '1:782580808831:web:cf38086fab27196cac534a',
    messagingSenderId: '782580808831',
    projectId: 'chat-76c36',
    authDomain: 'chat-76c36.firebaseapp.com',
    storageBucket: 'chat-76c36.appspot.com',
    measurementId: 'G-2FZBKN0Q7D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm5SkZyr8nIE8zFANU5yb_RMw86Ry-h2g',
    appId: '1:782580808831:android:edebda7902786fc1ac534a',
    messagingSenderId: '782580808831',
    projectId: 'chat-76c36',
    storageBucket: 'chat-76c36.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAi31AKN42T4QEOx69x8EJN6R0SB_UhsA',
    appId: '1:782580808831:ios:6f94f8264b7682fbac534a',
    messagingSenderId: '782580808831',
    projectId: 'chat-76c36',
    storageBucket: 'chat-76c36.appspot.com',
    iosClientId: '782580808831-lflacpm1bioku8utaru52jks7rdsfh95.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAi31AKN42T4QEOx69x8EJN6R0SB_UhsA',
    appId: '1:782580808831:ios:6f94f8264b7682fbac534a',
    messagingSenderId: '782580808831',
    projectId: 'chat-76c36',
    storageBucket: 'chat-76c36.appspot.com',
    iosClientId: '782580808831-lflacpm1bioku8utaru52jks7rdsfh95.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
