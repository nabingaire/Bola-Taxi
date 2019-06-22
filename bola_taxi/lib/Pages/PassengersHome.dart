import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PassengersHome extends StatefulWidget {
  @override
  _PassengersHomeState createState() => _PassengersHomeState();
}

class _PassengersHomeState extends State<PassengersHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PassengerHomeUI(),
    );
  }
}

class PassengerHomeUI extends StatefulWidget {
  @override
  _PassengerHomeUIState createState() => _PassengerHomeUIState();
}

class _PassengerHomeUIState extends State<PassengerHomeUI> {
  GoogleMapController mapController;

  final LatLng _kathMandu = const  LatLng(27.708576,85.3348869);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bola Taxi"),
      ),
      drawer: MenuDrawer(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _kathMandu,
          zoom: 12.0,
        ),
        myLocationEnabled: true,
      ),
    );
  }
}
