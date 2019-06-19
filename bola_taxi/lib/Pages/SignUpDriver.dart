import 'package:flutter/material.dart';

class SignUpDriver extends StatefulWidget {
  @override
  _SignUpDriverState createState() => _SignUpDriverState();
}

class _SignUpDriverState extends State<SignUpDriver> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
           TextField(
              decoration: InputDecoration(
                labelText: 'Taxi_no',
              ),
           ),
      
             Container(
                  child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.deepPurpleAccent[400],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0,20,0,20),
        ),
          ],
        ),
      
      padding: EdgeInsets.fromLTRB(30, 50, 30, 30),),
     
    );
  }
}
