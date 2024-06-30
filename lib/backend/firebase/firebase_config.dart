import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCy5fNj7DEcZR3TVwqFbrU_-1RqLCLGYuI",
            authDomain: "evezeeta.firebaseapp.com",
            projectId: "evezeeta",
            storageBucket: "evezeeta.appspot.com",
            messagingSenderId: "359096720103",
            appId: "1:359096720103:web:eb522aa0ab8e50582de042",
            measurementId: "G-D18PLDN1DM"));
  } else {
    await Firebase.initializeApp();
  }
}
