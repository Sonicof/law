import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyABICJTD6zUr6fEwTrm6Et9ac6qcrdeLos",
            authDomain: "law1-fb4bd.firebaseapp.com",
            projectId: "law1-fb4bd",
            storageBucket: "law1-fb4bd.firebasestorage.app",
            messagingSenderId: "537192272463",
            appId: "1:537192272463:web:ef7702aa65fc4b1ca5503a"));
  } else {
    await Firebase.initializeApp();
  }
}
