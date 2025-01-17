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
    apiKey: 'AIzaSyBIzuDh39WgIyXe_pmFRLLZQuyKzWMr8-Q',
    appId: '1:16912075661:web:61a601b8fa6c1d2b20cbc4',
    messagingSenderId: '16912075661',
    projectId: 'jokes-app-83e47',
    authDomain: 'jokes-app-83e47.firebaseapp.com',
    storageBucket: 'jokes-app-83e47.firebasestorage.app',
    measurementId: 'G-WLD4N4JP8Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTx2cjyQ6FQjYvkHLfxj7sIcjSrkSH5Kw',
    appId: '1:16912075661:android:1dcd732ae9dfa16520cbc4',
    messagingSenderId: '16912075661',
    projectId: 'jokes-app-83e47',
    storageBucket: 'jokes-app-83e47.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXjy-wqCws450PgD7ZES9cDUvJyfZ-5Bk',
    appId: '1:16912075661:ios:690346a95e69211c20cbc4',
    messagingSenderId: '16912075661',
    projectId: 'jokes-app-83e47',
    storageBucket: 'jokes-app-83e47.firebasestorage.app',
    iosBundleId: 'com.example.laboratoriesMis2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXjy-wqCws450PgD7ZES9cDUvJyfZ-5Bk',
    appId: '1:16912075661:ios:690346a95e69211c20cbc4',
    messagingSenderId: '16912075661',
    projectId: 'jokes-app-83e47',
    storageBucket: 'jokes-app-83e47.firebasestorage.app',
    iosBundleId: 'com.example.laboratoriesMis2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIzuDh39WgIyXe_pmFRLLZQuyKzWMr8-Q',
    appId: '1:16912075661:web:c5e77e462627248920cbc4',
    messagingSenderId: '16912075661',
    projectId: 'jokes-app-83e47',
    authDomain: 'jokes-app-83e47.firebaseapp.com',
    storageBucket: 'jokes-app-83e47.firebasestorage.app',
    measurementId: 'G-39P8YNDW2G',
  );
}
