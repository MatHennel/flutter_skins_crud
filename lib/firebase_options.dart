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
    apiKey: 'AIzaSyBq_k4qWlEcazi8t4ZJEpjLO_NxR2DAFCY',
    appId: '1:410211543449:web:f1906a6a69e69bbfde4b08',
    messagingSenderId: '410211543449',
    projectId: 'flutter-skins-crud',
    authDomain: 'flutter-skins-crud.firebaseapp.com',
    storageBucket: 'flutter-skins-crud.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx8jVFOOw8bN-uePgvn8Vy6IdUWCRaYLA',
    appId: '1:410211543449:android:e035c0624ccac800de4b08',
    messagingSenderId: '410211543449',
    projectId: 'flutter-skins-crud',
    storageBucket: 'flutter-skins-crud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmDmIUdBmvmOqv4pn89BRr5XGKgJfbkpc',
    appId: '1:410211543449:ios:a1cd6dc18bd38f30de4b08',
    messagingSenderId: '410211543449',
    projectId: 'flutter-skins-crud',
    storageBucket: 'flutter-skins-crud.appspot.com',
    iosClientId: '410211543449-frjj4s0g900ghhqinpdjqddtkhvtgqld.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSkinsCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmDmIUdBmvmOqv4pn89BRr5XGKgJfbkpc',
    appId: '1:410211543449:ios:d260c0dac65431abde4b08',
    messagingSenderId: '410211543449',
    projectId: 'flutter-skins-crud',
    storageBucket: 'flutter-skins-crud.appspot.com',
    iosClientId: '410211543449-pads192hb2mfr01lp1tep6a7tjrc6634.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSkinsCrud.RunnerTests',
  );
}
