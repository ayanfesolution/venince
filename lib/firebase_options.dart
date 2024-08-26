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
    apiKey: 'AIzaSyBsyabUP_yV7PTbsWtV6b-eWVra9w_QDPg',
    appId: '1:678649964403:web:94d6f4bcacf22ad2550706',
    messagingSenderId: '678649964403',
    projectId: 'vinance-project',
    authDomain: 'vinance-project.firebaseapp.com',
    storageBucket: 'vinance-project.appspot.com',
    measurementId: 'G-X0Y03EL75D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhPKBFeLIZB3Z3wCuxgIt_aFxueelkjzY',
    appId: '1:678649964403:android:4ec80404ac9f76f2550706',
    messagingSenderId: '678649964403',
    projectId: 'vinance-project',
    storageBucket: 'vinance-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ82qh5pUnGvUuXMA9oUn1ywItHfExTMk',
    appId: '1:678649964403:ios:7a3e87a9b7f96751550706',
    messagingSenderId: '678649964403',
    projectId: 'vinance-project',
    storageBucket: 'vinance-project.appspot.com',
    androidClientId: '678649964403-tblup8b0a8a58gka57d93fvj2d00lufo.apps.googleusercontent.com',
    iosClientId: '678649964403-e4rjlktj8be35ebmol8k013vrpdn8qtq.apps.googleusercontent.com',
    iosBundleId: 'dev.vlab.vinance',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ82qh5pUnGvUuXMA9oUn1ywItHfExTMk',
    appId: '1:678649964403:ios:20e5f7765752872d550706',
    messagingSenderId: '678649964403',
    projectId: 'vinance-project',
    storageBucket: 'vinance-project.appspot.com',
    iosBundleId: 'dev.vlab.vinance.RunnerTests',
  );
}