import 'package:flutter/material.dart';


class ResetRequest extends StatefulWidget {
  @override
  _ResetRequestState createState() => _ResetRequestState();
}

class _ResetRequestState extends State<ResetRequest> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text("Reset Password"),
          ),
           leading: new IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: new Icon(Icons.arrow_back),
          iconSize: 35,
          color: Colors.white,
        ),
          backgroundColor: Colors.deepPurpleAccent[400],
        ),
        body: _ResetRequestUI(),
      ),
    );
  
  }
}
class _ResetRequestUI extends StatelessWidget {
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
              )
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
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      )
    );
      
  }
}