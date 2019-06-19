import 'package:flutter/material.dart';

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
        title: Text("Bola Taxi"),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              
              margin: const EdgeInsets.only(bottom: 80.0),
  
         
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
               trailing: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Change Status"),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Ride History"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
         
            ListTile(
              title: Text("Setting"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Logout"),
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