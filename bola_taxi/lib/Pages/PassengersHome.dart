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
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              
              margin: const EdgeInsets.only(right: 80.0),
  
        
              child:  Container(
               width: 0,
               height: 0,
                decoration: BoxDecoration(
                  color: Colors.purple,

                  
                  image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pp.png',),
                  
                  
                  
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80))
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