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
    apiKey: 'AIzaSyDyWJl7yMoEdYpmY7NVLouE0zsca__Fmi0',
    appId: '1:283687047655:web:1f4f486dcc80a4c45b2d42',
    messagingSenderId: '283687047655',
    projectId: 'flutter-notifications-4aef9',
    authDomain: 'flutter-notifications-4aef9.firebaseapp.com',
    storageBucket: 'flutter-notifications-4aef9.appspot.com',
    measurementId: 'G-R06E63LHV3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpLx4dhn0wYjjpNryFbw1IFIg6M8bc_ts',
    appId: '1:283687047655:android:278990a9b12903ac5b2d42',
    messagingSenderId: '283687047655',
    projectId: 'flutter-notifications-4aef9',
    storageBucket: 'flutter-notifications-4aef9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBN-5lr7aG4E1r0EgnOYuzb1YozVKjVpP8',
    appId: '1:283687047655:ios:4db33d8e5225f7cd5b2d42',
    messagingSenderId: '283687047655',
    projectId: 'flutter-notifications-4aef9',
    storageBucket: 'flutter-notifications-4aef9.appspot.com',
    iosBundleId: 'com.abdullahindustries.flutterNotifications',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBN-5lr7aG4E1r0EgnOYuzb1YozVKjVpP8',
    appId: '1:283687047655:ios:c1b63dd76857ca395b2d42',
    messagingSenderId: '283687047655',
    projectId: 'flutter-notifications-4aef9',
    storageBucket: 'flutter-notifications-4aef9.appspot.com',
    iosBundleId: 'com.abdullahindustries.flutterNotifications.RunnerTests',
  );
}