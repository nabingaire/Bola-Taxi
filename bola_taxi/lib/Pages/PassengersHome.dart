// import 'package:flutter/material.dart';

// class PassengersHome extends StatefulWidget {
//   @override
//   _PassengersHomeState createState() => _PassengersHomeState();
// }

// class _PassengersHomeState extends State<PassengersHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bola Taxi"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
              
//               margin: const EdgeInsets.only(bottom: 40.0),
//               currentAccountPicture: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: Image.asset(''),
//                   )
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text("Home"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text("Ride History"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text("Notifications"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text("Setting"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text("Logout"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
