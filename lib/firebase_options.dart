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
    apiKey: 'AIzaSyAO3CFj4GS1rHfKduJbGYvVXuQ5WubMbTI',
    appId: '1:272422552145:web:860143c4b40097370b2e70',
    messagingSenderId: '272422552145',
    projectId: 'sistematizacaoceub-704ad',
    authDomain: 'sistematizacaoceub-704ad.firebaseapp.com',
    storageBucket: 'sistematizacaoceub-704ad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxbrlVG_SYnPCx_ulfRXMXrQhDKCYIOvI',
    appId: '1:272422552145:android:7dfcdd7752cd22b20b2e70',
    messagingSenderId: '272422552145',
    projectId: 'sistematizacaoceub-704ad',
    storageBucket: 'sistematizacaoceub-704ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF_29gxNtu6lxIyJcSTFSx4PVLVAyvDkE',
    appId: '1:272422552145:ios:4cd2a9f6191ae7940b2e70',
    messagingSenderId: '272422552145',
    projectId: 'sistematizacaoceub-704ad',
    storageBucket: 'sistematizacaoceub-704ad.appspot.com',
    iosClientId: '272422552145-m45976uoi18rvq8l0sqi6bi6bb2gtm4e.apps.googleusercontent.com',
    iosBundleId: 'com.example.sistematizacao',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAF_29gxNtu6lxIyJcSTFSx4PVLVAyvDkE',
    appId: '1:272422552145:ios:4cd2a9f6191ae7940b2e70',
    messagingSenderId: '272422552145',
    projectId: 'sistematizacaoceub-704ad',
    storageBucket: 'sistematizacaoceub-704ad.appspot.com',
    iosClientId: '272422552145-m45976uoi18rvq8l0sqi6bi6bb2gtm4e.apps.googleusercontent.com',
    iosBundleId: 'com.example.sistematizacao',
  );
}
