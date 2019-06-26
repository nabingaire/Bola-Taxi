import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 0, 50, 80),
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    NavigationHelper(context).goTOUserProfile();
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/bheda.png',
                    ),
                    maxRadius: 56,
                  ),
                ),
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
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
              NavigationHelper(context).goToRideHistory();
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
              NavigationHelper(context).goToLoginChoice();
            },
          ),
        ],
      ),
    );
  }
}
