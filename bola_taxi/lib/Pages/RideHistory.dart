import 'package:flutter/material.dart';

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(
        title: Text("Ride History"),
        backgroundColor: Colors.deepPurpleAccent[400],
        
      ),
    );
  }
}

