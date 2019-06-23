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
  LatLng _kathMandu = LatLng(27.708576, 85.3348869);

  //Markers
  List<Marker> _mapMarkers;

  @override
  Widget build(BuildContext context) {
    // _mapMarkers.add(Marker(
    //     markerId: MarkerId('ny'), position: LatLng(27.7129365, 85.3180723)));
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
              onTap: _handleTap,
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
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(27.7083355, 85.3131555),
                    builder: (ctx) => new Container(
                          child: Icon(Icons.location_on),
                        ),
                  ),
                ],
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
                        Icons.local_taxi,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      label: Text(
                        'Pick me Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.deepPurpleAccent[400]),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          )
        ],
      ),
    );
  }

  _handleTap(LatLng point) {
    setState(() {
      _mapMarkers.add(Marker(point: point));
    });
  }
}
