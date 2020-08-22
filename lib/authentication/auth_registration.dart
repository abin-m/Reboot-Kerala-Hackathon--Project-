import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jyothi/constant.dart';
import 'package:jyothi/dashboard/home.dart';
import 'package:jyothi/model1.dart';
import 'package:jyothi/registrationdetails.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:jyothi/roundedButton.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (newUser != null) {
                      print(newUser);
                      GetUserDetails(newUser);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetails()),
                      );
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} /*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'auth_signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jyothi/form_controller.dart';
import 'package:jyothi/model/form.dart';

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String dpt =
      "General section Revenue section Engineering section Health section Accounts section";
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController empController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dojController = TextEditingController();
  TextEditingController dptController = TextEditingController();
  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          empController.text,
          mobController.text,
          ageController.text,
          dptController.text,
          dojController.text);
      FormController formController = FormController();
      _showSnackbar("Submitting Feedback");
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          _showSnackbar("Feedback Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  final listofdep = [
    "Chairman",
    "Mayer"
        "Secratary",
    "Assistant secratery",
    "Superintendent",
    "Municipal Enginee",
    "Assistant Engineer ",
    "Revenue Officer",
    "Revenue Inspector",
    "Chief Accountant",
    "UD Clerk",
    "LD Clerk",
    "Typist",
    "Office Assistant",
    "Attender's",
    "Health Supervisor ",
    "Health Inspector ",
    "Junior Health Inspector",
    "Junior Public Health Nurse",
    "Panchayath President"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Text('Register',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Enter User Name",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter User Name';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            controller: empController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Enter Employment ID",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Employment ID';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: mobController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Mobile Number",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter 10 digit Mobile number';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageController,
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
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: dptController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Department",
                              hintText: "LD clerck,Assistant Engineer",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter the department you are currently working';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            controller: dojController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: "Enter Year of Joining",
                              hintText: 'YYYY',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ), //validation
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter The Year of Joining';
                              }
                              return null;
                            }),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed:
                            /* () async {
                          // DocumentReference ref =
                          await db.collection('Registrations').add({
                            'name': nameController.text,
                            'EmployeeId': empController.text,
                            'mobilenumber': mobController.text,
                            'age': ageController.text,
                            'Job_title': dptController.text,
                            'year_of_j': dojController.text
                          });
                        },*/
                            () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SignIn();
                          }));
                        },
                      ),
                      SizedBox(
                        height: 25,
                      )
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
*/
