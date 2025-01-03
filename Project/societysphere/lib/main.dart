import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:societysphere/aanouncement.dart';
import "package:societysphere/admindashboard.dart";
import "package:societysphere/loginPage.dart";
import "package:societysphere/makebalanceSheet.dart";
import 'package:societysphere/notices.dart';
import "package:societysphere/showbalancesheet.dart";
import "package:societysphere/splashScreen.dart";
import 'package:societysphere/Facilities.dart';
import "package:societysphere/userProvider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyApOTY4Ijqcv9-78ZJKWoaxhuqcgswGI9Q",
      authDomain: "com.example.societysphere",
      projectId: "projsocietysphere",
      storageBucket: "projsocietysphere.firebasestorage.app",
      messagingSenderId: "281872240188",
      appId: "1:281872240188:android:6420f799277c373e24fd39",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Ensure SplashScreen is implemented
    );
  }
}
