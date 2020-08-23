import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String userid;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class Activity {
  String name;
  String stdate;
  String enddate;
}

class _DashBoardState extends State<DashBoard> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
    getactivities();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Text('abcd'),
      ),

      /*Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                
              ],
            ),
          ),

        ],
      ),*/
    );
  }

  var activitylist = new List<Activity>();
  void getactivities() async {
    final userdata =
        await _firestore.collection('useractivities').getDocuments();
    for (var activity in userdata.documents) {
      if (activity.data['userid'] == loggedInUser.email) {
        setState(() {
          var activi = new Activity();
          activi.name = activity.data['name'];
          activi.stdate = activity.data['stdate'];
          activi.enddate = activity.data['enddate'];

          activitylist.add(activi);
        });
      }
    }
  }
}
