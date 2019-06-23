import 'package:bola_taxi/Helper/form-helper.dart';
import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:bola_taxi/Helper/widgets-generator-helper.dart';
import 'package:flutter/material.dart';

class LoginPassenger extends StatefulWidget {
  @override
  _LoginPassengerState createState() => _LoginPassengerState();
}

class _LoginPassengerState extends State<LoginPassenger> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPassengerUI(),
    );
  }
}

class LoginPassengerUI extends StatefulWidget {
  @override
  _LoginPassengerUIState createState() => _LoginPassengerUIState();
}

class _LoginPassengerUIState extends State<LoginPassengerUI> {
  String _phoneNo;
  String _password;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            Text("Bola Taxi",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile',
              ),
              onSaved: (String value) {
                _phoneNo = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Phone cant be empty';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onSaved: (String value) {
                  _password = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password cant be empty';
                  } else {
                    return null;
                  }
                },
                obscureText: true),
            Container(
              child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      FormHelper formHelper =
                          new FormHelper(context, _loginFormKey);
                      formHelper.saveForm();
                      WidgetsGeneratorHelper(context)
                          .showSnackBar("Logging In");
                      checkIfCanLoginAndRedirect(context);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.deepPurpleAccent[400],
                  )),
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ]),
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(children: <Widget>[
                Text(
                  "New Here?",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ]),
              padding: EdgeInsets.fromLTRB(0, 140, 0, 0),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ]),
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(30, 70, 30, 10),
    ));
  }

  checkIfCanLoginAndRedirect(context) {
    String url = "/passengers/login.php";

    Object loginData = {"phone": _phoneNo, "password": _password};

    HttpHelper().post(url, body: loginData).then((value) => setState(() {
          if (value["response_code"] == 200) {
            NavigationHelper(context).goToPassengersHome(args:value);
            print("From http helper");
            print(value);
          } else
            WidgetsGeneratorHelper(context)
                .showSnackBar("Either phone or password is incorrect");
        }));
  }
}
