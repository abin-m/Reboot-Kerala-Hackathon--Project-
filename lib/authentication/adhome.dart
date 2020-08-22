import 'package:flutter/material.dart';
import 'package:jyothi/dashboard/fileread.dart';

//Admins Home page
class AdminsHome extends StatefulWidget {
  @override
  _AdminsHomeState createState() => _AdminsHomeState();
}

class _AdminsHomeState extends State<AdminsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admins DashBoard',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Card(
                  elevation: 15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Analysis()),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Review Clerks',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                onPressed: () {},
                child: Card(
                  elevation: 15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Analysis()),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Review Secretary',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                onPressed: () {},
                child: Card(
                  elevation: 15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Analysis()),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Notify Members',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
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
