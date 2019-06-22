import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class PassengersHome extends StatefulWidget {
  @override
  _PassengersHomeState createState() => _PassengersHomeState();
}

class _PassengersHomeState extends State<PassengersHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _PassengersHomeUI(),
    );
  }
}

class _PassengersHomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bola Taxi"),
      ),
      
      drawer: MenuDrawer(),
    );
  }
}