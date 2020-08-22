import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jyothi/dashboard/home.dart';
import 'constant.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final nmecontrl = TextEditingController();
  final agecontrl = TextEditingController();
  final mobcontrl = TextEditingController();
  final yojcontrl = TextEditingController();
  final jobcontrl = TextEditingController();
  final eidcontrl = TextEditingController();
  final emailcontrl = TextEditingController();
  String dropdownValue = "Enter The Job title";
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(user);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Complete the Registration',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: nmecontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Name",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Name';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: emailcontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Name';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: agecontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Age",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Age';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: mobcontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Mobile number",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter mob';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: yojcontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter year of joining",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter year of joining';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: eidcontrl,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Employment Id",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter EMP id';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 250,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Enter The Job title',
                              'Engineer',
                              'Clerk',
                              'Secretary'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            _firestore.collection('userdata').add({
                              'name': nmecontrl.text,
                              'email': emailcontrl.text,
                              'age': agecontrl.text,
                              'job': dropdownValue,
                              'yoj': yojcontrl.text,
                              'mobile': mobcontrl.text,
                              'emp': eidcontrl.text,
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
