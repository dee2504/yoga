import 'package:flutter/material.dart';
import 'admission_form.dart'; // Import the admission form
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Optionally, provide the Firebase options for your project
    options: const FirebaseOptions(
        apiKey: "AIzaSyC4Y5B65VMrFGjn22zjJbZV-z1RZEBkbfs",
        authDomain: "flexmoney-yoga-form-1b59b.firebaseapp.com",
        projectId: "flexmoney-yoga-form-1b59b",
        storageBucket: "flexmoney-yoga-form-1b59b.appspot.com",
        messagingSenderId: "113546411530",
        appId: "1:113546411530:web:95c8691137a6c4cbd3e9f3",
        measurementId: "G-M8FJJVBY97"),
  );
  runApp(const YogaClassApp());
}

class YogaClassApp extends StatelessWidget {
  const YogaClassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yoga Class Admission',
      home: AdmissionForm(),
    );
  }
}
