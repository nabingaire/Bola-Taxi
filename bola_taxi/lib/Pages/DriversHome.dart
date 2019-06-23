import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DriversHome extends StatefulWidget {
  @override
  _DriversHomeState createState() => _DriversHomeState();
}

class _DriversHomeState extends State<DriversHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _DriversHomeUI(),
    );
  }
}

class _DriversHomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bola Taxi",
          ),
          backgroundColor: Colors.deepPurpleAccent[400],
        ),
        drawer: MenuDrawer(),
        body: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text("Origin: baneshwor" +
                    " " +
                    "Destination: koteshwor" +
                    " " +
                    "\n Phone: 9844785589 " +
                    "Requested time: 12:53:02"),
              )
            ],
          ),
        ));
  }
}
