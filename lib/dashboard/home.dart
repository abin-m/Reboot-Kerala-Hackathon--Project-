import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jyothi/dashboard/clerkQuiz.dart';
import 'package:jyothi/dashboard/competencyquiz.dart';
import 'package:jyothi/dashboard/kila.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String name = " ";
String job = " ";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    getmessages();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DashBoard',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 16,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                  ),
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text(job),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                FlatButton(
                  onPressed: () {
                    if (job == 'Secretary') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Quiz()),
                      );
                    }
                    if (job == 'Clerk') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClerkQuiz()),
                      );
                    }
                  },
                  child: Card(
                    elevation: 15,
                    child: ListTile(
                      title: Text(
                        'Competency Quiz',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      subtitle: Text(job),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Card(
                    elevation: 15,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Kila()),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'Additional courses',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text(job),
                      ),
                    ),
                  ),
                ),
                /*FlatButton(
                  onPressed: () {},
                  child: Card(
                    elevation: 15,
                    child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: Text(
                          'Enrolled courses',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text(job),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Card(
                    elevation: 15,
                    child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: Text(
                          'Skill level',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text('Executive Engineer'),
                      ),
                    )
                  ),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }

  void getmessages() async {
    final userdata = await _firestore.collection('userdata').getDocuments();
    for (var msg in userdata.documents) {
      if (msg.data['email'] == loggedInUser.email) {
        setState(() {
          name = msg.data['name'];
          job = msg.data['job'];
        });
      }
    }
  }
}

/*class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return 
  }
}*/
