// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB-eaECJUTB328-EXwzUSHJHJ-NtN6Yg7k',
    appId: '1:770222304217:web:327d41d33b3a1b118d07c8',
    messagingSenderId: '770222304217',
    projectId: 'zerobalance-8b44d',
    authDomain: 'zerobalance-8b44d.firebaseapp.com',
    storageBucket: 'zerobalance-8b44d.appspot.com',
    measurementId: 'G-PR156Y68ED',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZJuGnyhbElk27REK-mucRZnHd2zAlZn8',
    appId: '1:770222304217:android:f43b059333ee109c8d07c8',
    messagingSenderId: '770222304217',
    projectId: 'zerobalance-8b44d',
    storageBucket: 'zerobalance-8b44d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDldKlyC3qmDcY2X3A3mfb5oE7mGCdLEqs',
    appId: '1:770222304217:ios:f422d8708cf911778d07c8',
    messagingSenderId: '770222304217',
    projectId: 'zerobalance-8b44d',
    storageBucket: 'zerobalance-8b44d.appspot.com',
    androidClientId: '770222304217-4p412cut6n3ahrbgt0j9dha2l53jbo6g.apps.googleusercontent.com',
    iosClientId: '770222304217-0p1s46dgjtrs6krpls3jgs88uo677kro.apps.googleusercontent.com',
    iosBundleId: 'com.example.zerobalance',
  );
}
