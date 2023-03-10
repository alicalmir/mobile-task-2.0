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
    apiKey: 'AIzaSyDhYiVQaWg7eMUUcOUQ_m5cXMd3VCHxJv8',
    appId: '1:1015948567499:web:f3d74dd9c23e4ff608cc4e',
    messagingSenderId: '1015948567499',
    projectId: 'mobile-task-33bf0',
    authDomain: 'mobile-task-33bf0.firebaseapp.com',
    storageBucket: 'mobile-task-33bf0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2zulUALggroikyPF4zEXZdsUDWDMsw-w',
    appId: '1:1015948567499:android:dd83742cbf6e09a208cc4e',
    messagingSenderId: '1015948567499',
    projectId: 'mobile-task-33bf0',
    storageBucket: 'mobile-task-33bf0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9RtCv6CWz_Cwr9qAgeOOOh36fW5-xt4g',
    appId: '1:1015948567499:ios:6bf833400d5e328108cc4e',
    messagingSenderId: '1015948567499',
    projectId: 'mobile-task-33bf0',
    storageBucket: 'mobile-task-33bf0.appspot.com',
    iosClientId: '1015948567499-8monp1eiturjjo11mb8siai4hhgn3rr7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9RtCv6CWz_Cwr9qAgeOOOh36fW5-xt4g',
    appId: '1:1015948567499:ios:6bf833400d5e328108cc4e',
    messagingSenderId: '1015948567499',
    projectId: 'mobile-task-33bf0',
    storageBucket: 'mobile-task-33bf0.appspot.com',
    iosClientId: '1015948567499-8monp1eiturjjo11mb8siai4hhgn3rr7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileTask',
  );
}
