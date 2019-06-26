import 'package:flutter/material.dart';

class InputCode extends StatefulWidget {
  @override
  _InputCodeState createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text("Confirmation Code"),
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
        body: _InputCodeUI(),
      ),
    );
  }
}
class _InputCodeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter code',
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