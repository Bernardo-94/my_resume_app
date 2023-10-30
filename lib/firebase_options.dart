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
    apiKey: 'AIzaSyBc21V8-SXIhg5f3eUnWq8pK8K-VPloHTA',
    appId: '1:191462736233:web:bdb78a40956f3a81a37df8',
    messagingSenderId: '191462736233',
    projectId: 'bernardo-cardoso-presentation',
    authDomain: 'bernardo-cardoso-presentation.firebaseapp.com',
    storageBucket: 'bernardo-cardoso-presentation.appspot.com',
    measurementId: 'G-RFVYGCCSKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6srzbAHoDkUEo1_nFFB01p4eWjDNUlyI',
    appId: '1:191462736233:android:b5dde4e8d55560e7a37df8',
    messagingSenderId: '191462736233',
    projectId: 'bernardo-cardoso-presentation',
    storageBucket: 'bernardo-cardoso-presentation.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAffpgw7Q3DrCWDFsGWyz2K_JdQn5Jr3sU',
    appId: '1:191462736233:ios:6922de9603b09eb5a37df8',
    messagingSenderId: '191462736233',
    projectId: 'bernardo-cardoso-presentation',
    storageBucket: 'bernardo-cardoso-presentation.appspot.com',
    iosClientId: '191462736233-mhv04k7mbufe5vn0gums7o9qd666jsle.apps.googleusercontent.com',
    iosBundleId: 'com.example.bernardoCardosoPresentation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAffpgw7Q3DrCWDFsGWyz2K_JdQn5Jr3sU',
    appId: '1:191462736233:ios:f18f2bba83ddc0a6a37df8',
    messagingSenderId: '191462736233',
    projectId: 'bernardo-cardoso-presentation',
    storageBucket: 'bernardo-cardoso-presentation.appspot.com',
    iosClientId: '191462736233-vdurvsvmgvggtm00m1pfg6pvtg7lkdsd.apps.googleusercontent.com',
    iosBundleId: 'com.example.bernardoCardosoPresentation.RunnerTests',
  );
}