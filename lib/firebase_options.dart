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
    apiKey: 'AIzaSyDMlWcJ-HWy0XqJosBKkMJvWT_HHcHfNrQ',
    appId: '1:78253230531:web:ee398ef2a43974857f1576',
    messagingSenderId: '78253230531',
    projectId: 'brew-crew-ac8b4',
    authDomain: 'brew-crew-ac8b4.firebaseapp.com',
    storageBucket: 'brew-crew-ac8b4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1P4_QwsMC6_wQax2gYZNe_lmDleUPxvU',
    appId: '1:78253230531:android:add8b7c628d771a07f1576',
    messagingSenderId: '78253230531',
    projectId: 'brew-crew-ac8b4',
    storageBucket: 'brew-crew-ac8b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-H_kq2rU-2uGrkpown_sRBvLYlEhr2iE',
    appId: '1:78253230531:ios:7e796779e91df6417f1576',
    messagingSenderId: '78253230531',
    projectId: 'brew-crew-ac8b4',
    storageBucket: 'brew-crew-ac8b4.appspot.com',
    iosBundleId: 'com.vatican.coffeecrew.coffeeCrew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-H_kq2rU-2uGrkpown_sRBvLYlEhr2iE',
    appId: '1:78253230531:ios:6bc2ba1579d5c78e7f1576',
    messagingSenderId: '78253230531',
    projectId: 'brew-crew-ac8b4',
    storageBucket: 'brew-crew-ac8b4.appspot.com',
    iosBundleId: 'com.vatican.coffeecrew.coffeeCrew.RunnerTests',
  );
}
