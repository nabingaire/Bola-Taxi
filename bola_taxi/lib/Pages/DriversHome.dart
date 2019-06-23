import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        title: Text("Bola Taxi",
       ),
       backgroundColor: Colors.deepPurpleAccent[400],
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 60, 120, 800),
          
          children: <Widget>[
            DrawerHeader(
              
              decoration: BoxDecoration(
              
                color: Colors.white,
              
                 shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/pp.png')),
                        

              ),
             padding: EdgeInsets.fromLTRB(100, 100, 100, 100),

             
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
