

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
        
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 80),
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/pp.png',
                        ),
                        maxRadius: 56,
                      ),
                    ),
                    Text(
                      "Nabin Gaire",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // decoration: BoxDecoration(

                //   color: Colors.white,

                //    shape: BoxShape.circle,
                //       image: DecorationImage(
                //           fit: BoxFit.cover,
                //           image: AssetImage('assets/images/pp.png')),

                // ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Change Status"),
                leading: Icon(Icons.change_history),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Ride History"),
                leading: Icon(Icons.directions_bus),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.eject),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
          
            ],
          ),
        ),
      
        );
        
  }
}

Widget build(BuildContext context){

  return  Card(

    child: Column(mainAxisSize: MainAxisSize.min ,
    children: <Widget>[
    ListTile(
      leading: Icon(Icons.directions_car),
      title: Text("Origin: baneshwor" + " "+"Destination: koteshwor"+" "+"\n Phone: 9844785589 "+"Requested time: 12:53:02"),
    )
    ],
    ),

  );
}
