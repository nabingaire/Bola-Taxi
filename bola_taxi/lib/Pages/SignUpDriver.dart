import 'dart:convert';

import 'package:bola_taxi/Helper/form-helper.dart';
import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/widgets-generator-helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpDriver extends StatefulWidget {
  @override
  _SignUpDriverState createState() => _SignUpDriverState();
}

class _SignUpDriverState extends State<SignUpDriver> {
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
        body: SignUpDriverUI(),
      ),
    );
  }
}

class SignUpDriverUI extends StatefulWidget {
  @override
  _SignUpDriverUIState createState() => _SignUpDriverUIState();
}

class _SignUpDriverUIState extends State<SignUpDriverUI> {
  final _signUpDriverformKey = GlobalKey<FormState>();

  //Get form field data
  String _fullName = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';
  String _gender = 'Male';
  String _taxiNumber = '';

  @override
  Widget build(BuildContext context) {
    var _handleRadioValueChange1;
    var _radioValue1;

    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _signUpDriverformKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
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
                  labelText: "Phone Number",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone cannot be empty';
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
                    return 'Field cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _confirmPassword = value;
                },
                obscureText: true,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Taxi_no',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Taxi Number cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _taxiNumber = value;
                },
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      FormHelper formHelper =
                          new FormHelper(context, _signUpDriverformKey);
                      formHelper.saveForm();
                      formHelper.validateForm();
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
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      ),
    );
  }

  sendSignUpData() {
    String signupUrl = "/drivers/signup.php";

    HttpHelper http = new HttpHelper();

    /*The data first has to be added to the drivers DB and then to taxi_info where the taxi_number 
    has to be added which is done by the api
    */
    Object _signUpData = {
      "name": _fullName,
      "phone": _phoneNumber,
      "password": _password,
      "gender": _gender,
      "taxi_no": _taxiNumber
    };

    //Send data to drivers DB
    http.post(signupUrl, body: _signUpData);
  }
}
