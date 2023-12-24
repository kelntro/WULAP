import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbu-RJYI3Ws1R4y7Ltmp287zUsNsAWZGw',
    appId: '1:63809694970:android:3bd4b6cc68c0fb3be2ad43',
    messagingSenderId: '63809694970',
    projectId: 'wulap-mobile',
    storageBucket: 'wulap-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2YsGMv9mP-qq3bsOtNvtkylGmRXZ_lLk',
    appId: '1:63809694970:ios:c8a9aaa789d1fc1fe2ad43',
    messagingSenderId: '63809694970',
    projectId: 'wulap-mobile',
    storageBucket: 'wulap-mobile.appspot.com',
    iosClientId:
        '63809694970-k50lj86l5qv5gjoeoupd55j9u37e518b.apps.googleusercontent.com',
    iosBundleId: 'com.wulapapplication.app',
  );
}
