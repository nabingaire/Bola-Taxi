import 'dart:convert';

import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
  //Tap Count
  int _tapCount = 0;

  //Color
  List<Color> _buttonBackgroundColorsList = [
    Colors.deepPurpleAccent[400],
    Colors.indigo,
    Colors.green
  ];

  //Icon
  List<IconData> _buttonIconList = [
    Icons.arrow_upward,
    Icons.arrow_downward,
    Icons.thumb_up
  ];

  //Text
  List<String> _textList = ["Pick me up", "Drop me here", "Confirm"];

  //Markers
  List<Marker> _mapMarkers = [];

  //LatLng
  List<LatLng> locationDestinationLatLngList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bola Taxi"),
      ),
      drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: new MapOptions(
              center: new LatLng(27.7083355, 85.3131555),
              zoom: 13.0,
              onTap: (LatLng point) {
                _handleTap(point, context);
              },
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.tiles.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYXJvYmNlIiwiYSI6ImNqeDhqZXIwbjBsczEzcnF1cjNma3VhNHcifQ.IqytwuTwvYV1ftFptax9dA',
                  'id': 'mapbox.streets',
                },
              ),
              new MarkerLayerOptions(
                markers: _mapMarkers,
              ),
            ],
          ),
          Container(
            child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: RaisedButton.icon(
                      icon: Icon(
                        _buttonIconList[_tapCount],
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _tapCount++;
                        });
                      },
                      label: Text(
                        _textList[_tapCount],
                        style: TextStyle(color: Colors.white),
                      ),
                      color: _buttonBackgroundColorsList[_tapCount]),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          )
        ],
      ),
    );
  }

  _handleTap(LatLng point, BuildContext context) {
    setState(() {
      if (_tapCount <= 1) {
        //Only once per button click
        try {
          locationDestinationLatLngList.removeAt(_tapCount);
          _mapMarkers.removeAt(_tapCount);
        } catch (e) {
          print(e.toString());
        }

        locationDestinationLatLngList.insert(_tapCount, point);
        _mapMarkers.insert(
            _tapCount,
            Marker(
              width: 80.0,
              height: 80.0,
              point: point,
              builder: (ctx) => new Container(
                    child: Icon(
                      Icons.location_on,
                      color: _buttonBackgroundColorsList[0],
                      size: 40.0,
                    ),
                  ),
            ));
        print(locationDestinationLatLngList);
      }
    });
  }
}
