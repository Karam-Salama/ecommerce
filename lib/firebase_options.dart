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
    apiKey: 'AIzaSyClVJwUm3YpOB_JrU5A6OtI1FhKnN2IHcQ',
    appId: '1:912652311116:web:cd5330153ba52ff6a8b2e9',
    messagingSenderId: '912652311116',
    projectId: 'ecommerce-app-93c9c',
    authDomain: 'ecommerce-app-93c9c.firebaseapp.com',
    storageBucket: 'ecommerce-app-93c9c.appspot.com',
    measurementId: 'G-RS23BEZTP8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDindrVgYIjbqx150hx5A1Lln0hEY-OEk',
    appId: '1:912652311116:android:3b659256e4b89012a8b2e9',
    messagingSenderId: '912652311116',
    projectId: 'ecommerce-app-93c9c',
    storageBucket: 'ecommerce-app-93c9c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5r1ft8DtUfVex3u2IQTu2w2fXV3f1Zwg',
    appId: '1:912652311116:ios:bbaf055bc7800d88a8b2e9',
    messagingSenderId: '912652311116',
    projectId: 'ecommerce-app-93c9c',
    storageBucket: 'ecommerce-app-93c9c.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5r1ft8DtUfVex3u2IQTu2w2fXV3f1Zwg',
    appId: '1:912652311116:ios:bbaf055bc7800d88a8b2e9',
    messagingSenderId: '912652311116',
    projectId: 'ecommerce-app-93c9c',
    storageBucket: 'ecommerce-app-93c9c.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyClVJwUm3YpOB_JrU5A6OtI1FhKnN2IHcQ',
    appId: '1:912652311116:web:91d93afa91fc601da8b2e9',
    messagingSenderId: '912652311116',
    projectId: 'ecommerce-app-93c9c',
    authDomain: 'ecommerce-app-93c9c.firebaseapp.com',
    storageBucket: 'ecommerce-app-93c9c.appspot.com',
    measurementId: 'G-3EKDVF1NZV',
  );
}
