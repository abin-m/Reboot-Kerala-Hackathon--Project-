import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ClerkQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Competency Quiz',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: WebView(
        initialUrl:
            "https://docs.google.com/forms/d/e/1FAIpQLSd4mVD4bPPWwDLK51fcyzv76SxxChVCuIyJtoRr10VLLTOntw/viewform",
      ),
    );
  }
}
