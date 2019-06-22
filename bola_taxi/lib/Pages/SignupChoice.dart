import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:flutter/material.dart';

class SignUpChoice extends StatefulWidget {
  @override
  _SignUpChoiceState createState() => _SignUpChoiceState();
}

class _SignUpChoiceState extends State<SignUpChoice> {
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
        body: _SignUpChoiceUI(),
      ),
    );
  }
}
  class _SignUpChoiceUI extends StatelessWidget {
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

              )
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      NavigationHelper(context).goToPassengersSignUp();
                    },
                    child: const Text(
                      'Sign Up as Passengers',
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
                  child: RaisedButton(
                    onPressed: () {
                      NavigationHelper(context).goToDriverSignup();
                    },
                    child: const Text(
                      'Sign Up as Drivers',
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

