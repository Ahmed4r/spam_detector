// filepath: /lib/main.dart
import 'package:flutter/material.dart';
import 'package:maflutter/spam_detector.dart';
import 'package:maflutter/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpamDetector(),
      initialRoute: Splashscreen.routeName,
      routes: {
        SpamDetector.routeName: (context) => SpamDetector(),
        Splashscreen.routeName: (context) => Splashscreen(),
      },
    );
  }
}
