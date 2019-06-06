import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png')
        ],
      ),
    ));
  }
}
