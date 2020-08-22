import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Competency  Analysis',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: WebView(
        initialUrl:
            "https://docs.google.com/spreadsheets/d/1p6hX6oAt5JVpjZU0GDy6blOaSbSc10oMx9sVF4fUWm0/edit?usp=sharing",
      ),
    );
  }
}
