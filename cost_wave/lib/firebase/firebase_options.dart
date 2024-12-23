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
    apiKey: 'AIzaSyDEg-DufuKOv9t3x9R1IUTXB1IiHSPQQhI',
    appId: '1:772240536470:web:2b74fe80471ef5754363b7',
    messagingSenderId: '772240536470',
    projectId: 'cost-wave-441115',
    authDomain: 'cost-wave-441115.firebaseapp.com',
    storageBucket: 'cost-wave-441115.firebasestorage.app',
    measurementId: 'G-1C3BFCCD68',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaw9TPLlMk1itCelumQ9xzb19hSbg_0kI',
    appId: '1:772240536470:android:bccfeb8474817c2c4363b7',
    messagingSenderId: '772240536470',
    projectId: 'cost-wave-441115',
    storageBucket: 'cost-wave-441115.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA61byUq5xi3obC0KIOeWp0GP0wQHxyqY',
    appId: '1:772240536470:ios:0f0ae86b150bc3674363b7',
    messagingSenderId: '772240536470',
    projectId: 'cost-wave-441115',
    storageBucket: 'cost-wave-441115.firebasestorage.app',
    iosBundleId: 'com.example.costWave',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDA61byUq5xi3obC0KIOeWp0GP0wQHxyqY',
    appId: '1:772240536470:ios:0f0ae86b150bc3674363b7',
    messagingSenderId: '772240536470',
    projectId: 'cost-wave-441115',
    storageBucket: 'cost-wave-441115.firebasestorage.app',
    iosBundleId: 'com.example.costWave',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEg-DufuKOv9t3x9R1IUTXB1IiHSPQQhI',
    appId: '1:772240536470:web:d8f7510f764680044363b7',
    messagingSenderId: '772240536470',
    projectId: 'cost-wave-441115',
    authDomain: 'cost-wave-441115.firebaseapp.com',
    storageBucket: 'cost-wave-441115.firebasestorage.app',
    measurementId: 'G-5QP93VFZSN',
  );
}
