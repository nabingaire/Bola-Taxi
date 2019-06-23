import 'package:flutter/material.dart';

class ChangeStatus extends StatefulWidget {
  @override
  _ChangeStatusState createState() => _ChangeStatusState();

}

class _ChangeStatusState extends State<ChangeStatus> {
  @override
  Widget build(BuildContext context) {
    bool button1 = true;
  bool button2 = false;

  void _button1() {
    setState(() {
      button1 = false;
      button2 = true;
    });
  }

  void _button2() {
    setState(() {
      button1 = true;
      button2 = false;
    });
  }

     return Scaffold(
      appBar: AppBar(
        title: Text("Button State"),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            MaterialButton(
              onPressed: button1 ? _button1 : null,
              child: Text("button1"),
              color: Colors.greenAccent,
            ),
            MaterialButton(
              onPressed: button2 ? _button2 : null,
              child: Text("button2"),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}