import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyAJQ2_ZtBPt6UeqURdfvFKvJpWtWI_lwNI",
    authDomain: "fooddelivery-4th.firebaseapp.com",
    projectId: "fooddelivery-4th",
    storageBucket: "fooddelivery-4th.appspot.com",
    messagingSenderId: "255770610220",
    appId: "1:255770610220:web:c8a1c8de36e04fcc7a5f89",
    measurementId: "G-NK9N4PYJYH"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAJQ2_ZtBPt6UeqURdfvFKvJpWtWI_lwNI",
    authDomain: "fooddelivery-4th.firebaseapp.com",
    projectId: "fooddelivery-4th",
    storageBucket: "fooddelivery-4th.appspot.com",
    messagingSenderId: "255770610220",
    appId: "1:255770610220:android:b3f50ee7f4de1c5a7a5f89",
    measurementId: "G-NK9N4PYJYH"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAJQ2_ZtBPt6UeqURdfvFKvJpWtWI_lwNI",
    authDomain: "fooddelivery-4th.firebaseapp.com",
    projectId: "fooddelivery-4th",
    storageBucket: "fooddelivery-4th.appspot.com",
    messagingSenderId: "255770610220",
    appId: "1:255770610220:ios:8d757d7f4577a69c7a5f89",
    measurementId: "G-NK9N4PYJYH"
  );

}