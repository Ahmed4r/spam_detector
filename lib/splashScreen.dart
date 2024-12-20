import 'package:flutter/material.dart';
import 'dart:async';

import 'package:maflutter/spam_detector.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(
          SpamDetector.routeName); // Replace with your next screen route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/original-f8a02cd30a3eef02fb8e724647e0b03e.jpg',
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
