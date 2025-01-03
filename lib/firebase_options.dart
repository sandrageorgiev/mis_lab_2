// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCewoS0wSr88Fm0TelIX_pZW-WRF758o6g',
    appId: '1:87503880032:web:2aa9a640b6d2151b32a805',
    messagingSenderId: '87503880032',
    projectId: 'mis-lab-app-3',
    authDomain: 'mis-lab-app-3.firebaseapp.com',
    storageBucket: 'mis-lab-app-3.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPRJ8tUwU9fj_tzbkq7L5NEhMOq6lNvEg',
    appId: '1:87503880032:android:3867e050fbdf9a0c32a805',
    messagingSenderId: '87503880032',
    projectId: 'mis-lab-app-3',
    storageBucket: 'mis-lab-app-3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8sMJsGVUazj-ufM2pdoUj469pukYjEvI',
    appId: '1:87503880032:ios:f62d9dd7d3b8bc7d32a805',
    messagingSenderId: '87503880032',
    projectId: 'mis-lab-app-3',
    storageBucket: 'mis-lab-app-3.firebasestorage.app',
    iosBundleId: 'com.example.misLab2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8sMJsGVUazj-ufM2pdoUj469pukYjEvI',
    appId: '1:87503880032:ios:f62d9dd7d3b8bc7d32a805',
    messagingSenderId: '87503880032',
    projectId: 'mis-lab-app-3',
    storageBucket: 'mis-lab-app-3.firebasestorage.app',
    iosBundleId: 'com.example.misLab2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCewoS0wSr88Fm0TelIX_pZW-WRF758o6g',
    appId: '1:87503880032:web:e911273bbbac0cb832a805',
    messagingSenderId: '87503880032',
    projectId: 'mis-lab-app-3',
    authDomain: 'mis-lab-app-3.firebaseapp.com',
    storageBucket: 'mis-lab-app-3.firebasestorage.app',
  );

}