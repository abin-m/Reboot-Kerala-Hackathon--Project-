import 'package:flutter/material.dart';
import 'package:jyothi/authentication/auth_registration.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Registration();
  }
}
