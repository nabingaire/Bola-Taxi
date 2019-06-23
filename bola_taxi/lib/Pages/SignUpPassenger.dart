import 'package:bola_taxi/Helper/form-helper.dart';
import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/widgets-generator-helper.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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
        body: SignUpPassengerUI(),
      ),
    );
  }
}

class SignUpPassengerUI extends StatefulWidget {

  @override
  _SignUpPassengerUIState createState() => _SignUpPassengerUIState();
}

class _SignUpPassengerUIState extends State<SignUpPassengerUI> {
  

  
  //Form Key
  final _signUpPassengerformKey = GlobalKey<FormState>();

  String _fullName = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _signUpPassengerformKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'FullName',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Full Name cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _fullName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone Number cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _phoneNumber = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _password = value;
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Confirm Password cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _confirmPassword = value;
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Gender",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Gender cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      FormHelper helper =
                          new FormHelper(context, _signUpPassengerformKey);
                      helper.saveForm();
                      WidgetsGeneratorHelper(context)
                          .showSnackBar("Signing Up");

                      sendSignUpData();
                    },
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
        ),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      ),
    );
  }

  sendSignUpData() {
    String signUpUrl = "/passengers/signup.php";
    HttpHelper http = new HttpHelper();

    Object _signUpData = {
      "name": _fullName,
      "phone": _phoneNumber,
      "password": _password,
      "gender": _gender
    };

    print(http.post(signUpUrl, body: _signUpData));
  }
}
