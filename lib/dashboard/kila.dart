import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Kila extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'KILA E-LEARNING PLATFORM',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: WebView(
        initialUrl: "https://ecourses.kila.ac.in/",
      ),
    );
  }
}
