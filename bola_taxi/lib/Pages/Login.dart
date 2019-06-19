import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          TextField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
          TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true),
          Container(
            child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
              onPressed: () {},
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.deepPurpleAccent[400],
            )),
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Text(
                  "New Here?"
                ),
                Text(
                  " Sign Up",
                  style: TextStyle(color: Colors.deepPurpleAccent[400]),
                )
              ],
            )
            )
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 90, 10, 0),
    ));
  }
}

