import 'package:bola_taxi/Helper/form-helper.dart';
import 'package:flutter/material.dart';

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
  String _gender = '';
  String _taxiNumber = '';

  @override
  Widget build(BuildContext context) {
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
                  labelText: _fullName,
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Gender cannot be empty';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _gender = value;
                },
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
                      FormHelper helper = new FormHelper(context, _signUpDriverformKey);
                      helper.saveForm();
                      helper.showSnackBar();
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


}
