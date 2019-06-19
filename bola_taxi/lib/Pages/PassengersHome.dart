import 'package:flutter/material.dart';

class PassengersHome extends StatefulWidget {
  @override
  _PassengersHomeState createState() => _PassengersHomeState();
}

class _PassengersHomeState extends State<PassengersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bola Taxi"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
            
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[50],
                
              
              ),
            
              margin: const EdgeInsets.only(bottom: 40.0),


              child:  Container(
                
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                  
                  image: AssetImage('assets/images/pp.png')
                  )
                  
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
               
               leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Ride History"),
                leading: Icon(Icons.directions_car),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Notifications"),
                leading: Icon(Icons.notifications),
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
