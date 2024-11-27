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
    apiKey: 'AIzaSyC20fzUzXAMkeb4JN7h_7quL9dmri4f100',
    appId: '1:893472098723:web:6490e78d2cfa51cb9a7216',
    messagingSenderId: '893472098723',
    projectId: 'busspass-aa1f9',
    authDomain: 'busspass-aa1f9.firebaseapp.com',
    storageBucket: 'busspass-aa1f9.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF5tpVAuFPPekM5Kstq6eXjML9IWwDKm4',
    appId: '1:893472098723:android:3cf5d291f775c58a9a7216',
    messagingSenderId: '893472098723',
    projectId: 'busspass-aa1f9',
    storageBucket: 'busspass-aa1f9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB61AiFOviUMa_1ubBiWKRPnXeWPVk4u4',
    appId: '1:893472098723:ios:b0740dec271377299a7216',
    messagingSenderId: '893472098723',
    projectId: 'busspass-aa1f9',
    storageBucket: 'busspass-aa1f9.firebasestorage.app',
    iosBundleId: 'com.example.busspassApp-1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB61AiFOviUMa_1ubBiWKRPnXeWPVk4u4',
    appId: '1:893472098723:ios:074a753e91753e009a7216',
    messagingSenderId: '893472098723',
    projectId: 'busspass-aa1f9',
    storageBucket: 'busspass-aa1f9.firebasestorage.app',
    iosBundleId: 'com.example.busspassApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC20fzUzXAMkeb4JN7h_7quL9dmri4f100',
    appId: '1:893472098723:web:d282646ca29267699a7216',
    messagingSenderId: '893472098723',
    projectId: 'busspass-aa1f9',
    authDomain: 'busspass-aa1f9.firebaseapp.com',
    storageBucket: 'busspass-aa1f9.firebasestorage.app',
  );
}