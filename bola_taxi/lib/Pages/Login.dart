import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginUI(),
    );
  }
}


class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          TextField(
            decoration: InputDecoration(
              labelText: 'Mobile',
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
           Container(
            child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  color: Colors.white,
                )),
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          ),
          Container(

            alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Text("New Here?",
                          style: TextStyle(fontSize: 15,color: Colors.black),
                          ),
                        ]
                          ),
                          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          ),

         Container(
            child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  color: Colors.white,
                )),
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          ),
         
        ],
      ),
      padding: EdgeInsets.fromLTRB(10, 90, 10, 10),
    ));
  }
}
