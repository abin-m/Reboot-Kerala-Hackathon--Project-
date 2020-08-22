import 'package:flutter/material.dart';
import 'package:jyothi/dashboard/home.dart';

class SignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController empController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign In'),
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
                height: 88,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Text('Sign In',
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
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Home();
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
