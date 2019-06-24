import 'package:flutter/material.dart';



class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text("Forgot Password"),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            iconSize: 35,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurpleAccent[400],
        ),
        body: _ResetPasswordUI(),
      ),
    );
  }
}
class _ResetPasswordUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            
            TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
          
        ),
          Container(
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text(
                    'Submit ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.deepPurpleAccent[400],
                ),
              ),
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            ),
          ]
      ),
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),  
    ),
    
    );
  }
}