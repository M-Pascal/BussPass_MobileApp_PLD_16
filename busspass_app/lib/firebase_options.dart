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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAiQAwFhbuJVTJkFLMyzSckBfMyFCJsGCQ',
    appId: '1:104676529768:web:036720a8dde674d43a8ddd',
    messagingSenderId: '104676529768',
    projectId: 'busspass-33fab',
    authDomain: 'busspass-33fab.firebaseapp.com',
    storageBucket: 'busspass-33fab.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqvTQEGs3Z0vxjpQF5H6qakkYD3khxyxE',
    appId: '1:104676529768:android:b8f412c4e12cce513a8ddd',
    messagingSenderId: '104676529768',
    projectId: 'busspass-33fab',
    storageBucket: 'busspass-33fab.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGHLhiMXmdt9qF4RXjGve3MSoDEL6Am84',
    appId: '1:104676529768:ios:d05bff08dcca91833a8ddd',
    messagingSenderId: '104676529768',
    projectId: 'busspass-33fab',
    storageBucket: 'busspass-33fab.firebasestorage.app',
    iosBundleId: 'com.example.busspassApp',
  );
}
