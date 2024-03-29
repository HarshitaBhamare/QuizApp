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
    apiKey: 'AIzaSyC6UdCG1-LpkZmiw_Sz4VNC2DsRm85l7hI',
    appId: '1:198782982117:web:1a9c3772fb2099ba86c10c',
    messagingSenderId: '198782982117',
    projectId: 'quizapp-53439',
    authDomain: 'quizapp-53439.firebaseapp.com',
    storageBucket: 'quizapp-53439.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtp1huC5HK0VpW_pTHGcCKC5-4ZTVRXDA',
    appId: '1:198782982117:android:3d0640afa92211a886c10c',
    messagingSenderId: '198782982117',
    projectId: 'quizapp-53439',
    storageBucket: 'quizapp-53439.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHfeM2ovWbMuqDZNSTvcXGY5kCMRlh8gE',
    appId: '1:198782982117:ios:429006e51a7b016a86c10c',
    messagingSenderId: '198782982117',
    projectId: 'quizapp-53439',
    storageBucket: 'quizapp-53439.appspot.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHfeM2ovWbMuqDZNSTvcXGY5kCMRlh8gE',
    appId: '1:198782982117:ios:88ca95df8d84e77086c10c',
    messagingSenderId: '198782982117',
    projectId: 'quizapp-53439',
    storageBucket: 'quizapp-53439.appspot.com',
    iosBundleId: 'com.example.quizApp.RunnerTests',
  );
}
