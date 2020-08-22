import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Quiz extends StatelessWidget {
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
            "https://docs.google.com/forms/d/e/1FAIpQLSd6NuPp7IJ3vuawMow5v7zGyzIi-1hw7xQSMLn8w8Euln2hNA/viewform",
      ),
    );
  }
}
