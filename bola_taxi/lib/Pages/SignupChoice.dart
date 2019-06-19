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
          title: Text("Sign Up")

        )
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
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      NavigationHelper(context).goToPassengersSignUp();
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
          padding: EdgeInsets.fromLTRB(10, 200, 10, 0)),
    );
    }
  }

