import 'package:flutter/material.dart';
import 'package:jyothi/Activities/dashboard.dart';
import 'package:jyothi/authentication/auth_registration.dart';
import 'package:jyothi/dashboard/competencyquiz.dart';
import 'Splash_Screen/splash_screen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroPage();
  }
}
