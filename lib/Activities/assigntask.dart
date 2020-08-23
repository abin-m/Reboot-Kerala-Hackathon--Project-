import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jyothi/authentication/adhome.dart';
import 'package:jyothi/constant.dart';
import 'package:jyothi/dashboard/competencyquiz.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class AssignTask extends StatelessWidget {
  final textctrl = TextEditingController();
  final stdctrl = TextEditingController();
  final enddctrl = TextEditingController();
  final namectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Assign a task',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: textctrl,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter the Email id of the Employee",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ), //validation
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter the email';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: stdctrl,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter the starting date",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ), //validation
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter the starting date';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: namectrl,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter the Task",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ), //validation
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter the Task';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: enddctrl,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Enter the Ending date",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ), //validation
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter the ending date';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _firestore.collection('userdata').add({
                          'userid': textctrl.text,
                          'stdate': stdctrl,
                          'enddate': enddctrl.text,
                          'name': namectrl.text,
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminsHome()),
                        );
                      },
                      child: Text(
                        'SUBMIT',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
