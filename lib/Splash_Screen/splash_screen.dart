import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';

import '../authentication/auth_registration.dart';
import 'package:jyothi/authentication/signin_options.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      title: new Text(
        'Welcome to jyothi!',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      navigateAfterSeconds: LoginOptions(),
    );
  }
}
