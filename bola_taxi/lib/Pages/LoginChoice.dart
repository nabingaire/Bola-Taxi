import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:flutter/material.dart';

class LoginChoice extends StatefulWidget {
  @override
  _LoginChoiceState createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> {
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
        body: _LoginChoiceUI(),
      ),
    );
  }
}

class _LoginChoiceUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
              Text("Bola Taxi",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      NavigationHelper(context).goToPassengersLogin();
                    },
                    child: const Text(
                      'Login as Passenger',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.deepPurpleAccent[400],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      NavigationHelper(context).goToDriversLogin();
                    },
                    child: const Text(
                      'Login as Driver',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.deepPurpleAccent[400],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(10, 130, 10, 0)),
    );
  }
}
