import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyBHZw10Eui4GfXI-mKkPawmy3SCLCDe8sw',
    appId: '1:5905061053:web:a2c09a53fb6207efc0d3d4',
    messagingSenderId: '5905061053',
    projectId: 'mental-insight',
    authDomain: 'mental-insight.firebaseapp.com',
    storageBucket: 'mental-insight.appspot.com',
    measurementId: 'G-2MDE8SDR1E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSlAIXkYbh0EM41adV5nK_dKikD_0HmVQ',
    appId: '1:5905061053:android:17e7423e09a08414c0d3d4',
    messagingSenderId: '5905061053',
    projectId: 'mental-insight',
    storageBucket: 'mental-insight.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5vwteqKqzVw0qKVbsmBxuKFqa5iRUlu8',
    appId: '1:5905061053:ios:529d848c2dcf3ea0c0d3d4',
    messagingSenderId: '5905061053',
    projectId: 'mental-insight',
    storageBucket: 'mental-insight.appspot.com',
    iosBundleId: 'com.example.wellbeingJunction',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5vwteqKqzVw0qKVbsmBxuKFqa5iRUlu8',
    appId: '1:5905061053:ios:4da543d8e81a146fc0d3d4',
    messagingSenderId: '5905061053',
    projectId: 'mental-insight',
    storageBucket: 'mental-insight.appspot.com',
    iosBundleId: 'com.example.wellbeingJunction.RunnerTests',
  );
}
