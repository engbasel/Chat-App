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
    apiKey: 'AIzaSyCnPkvN74qUU36Dy3qB303Ebfaz-JrPxxY',
    appId: '1:384224802079:web:fc56824ee908c029ab2c2a',
    messagingSenderId: '384224802079',
    projectId: 'newchatapp-de0f2',
    authDomain: 'newchatapp-de0f2.firebaseapp.com',
    storageBucket: 'newchatapp-de0f2.appspot.com',
    measurementId: 'G-JDWZ53LPYM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHXI4qbFfM7tLUDitScpQ-v9dYm0C5Vzs',
    appId: '1:384224802079:android:b05000464d8405e0ab2c2a',
    messagingSenderId: '384224802079',
    projectId: 'newchatapp-de0f2',
    storageBucket: 'newchatapp-de0f2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5lufqwZFfoTyNc14HSdOYGWu7-g_yacE',
    appId: '1:384224802079:ios:6cf6b14ca25da56eab2c2a',
    messagingSenderId: '384224802079',
    projectId: 'newchatapp-de0f2',
    storageBucket: 'newchatapp-de0f2.appspot.com',
    iosClientId:
        '384224802079-e127oq1hrn59ck8tn4d0u4lvlomodh5p.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatTwo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5lufqwZFfoTyNc14HSdOYGWu7-g_yacE',
    appId: '1:384224802079:ios:6cf6b14ca25da56eab2c2a',
    messagingSenderId: '384224802079',
    projectId: 'newchatapp-de0f2',
    storageBucket: 'newchatapp-de0f2.appspot.com',
    iosClientId:
        '384224802079-e127oq1hrn59ck8tn4d0u4lvlomodh5p.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatTwo',
  );
}