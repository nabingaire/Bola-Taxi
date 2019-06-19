import 'package:flutter/material.dart';

class SignUpPassenger extends StatefulWidget {
  @override
  _SignUpPassengerState createState() => _SignUpPassengerState();
}

class _SignUpPassengerState extends State<SignUpPassenger> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text("Sign Up"),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            iconSize: 35,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurpleAccent[400],
        ),
        body: _SignUpPassengerUI(),
      ),
    );
  }
}

class _SignUpPassengerUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'FullName',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
            Container(
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.deepPurpleAccent[400],
                ),
              ),
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(30,0, 30,0),
      ),
    );
  }
}
