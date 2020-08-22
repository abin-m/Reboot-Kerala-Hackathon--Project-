import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
                    'Abin M ',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text('Executive Engineer'),
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
                  onPressed: () {},
                  child: Card(
                    elevation: 15,
                    child: ListTile(
                      title: Text(
                        'Competency Quiz',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      subtitle: Text('Executive Engineer'),
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
                          'Additional courses',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text('Executive Engineer'),
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
                          'Enrolled courses',
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        subtitle: Text('Executive Engineer'),
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
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
