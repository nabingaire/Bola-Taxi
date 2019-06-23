import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class RequestAcceptedPage extends StatefulWidget {
  var data;
  RequestAcceptedPage({this.data});
  @override
  _RequestAcceptedPageState createState() =>
      _RequestAcceptedPageState(data: data);
}

class _RequestAcceptedPageState extends State<RequestAcceptedPage> {
  var data;
  _RequestAcceptedPageState({this.data});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RequestAcceptedPageUI(data: data),
    );
  }
}

class RequestAcceptedPageUI extends StatefulWidget {
  var data;
  RequestAcceptedPageUI({this.data});
  @override
  _RequestAcceptedPageUIState createState() =>
      _RequestAcceptedPageUIState(requestData: data);
}

class _RequestAcceptedPageUIState extends State<RequestAcceptedPageUI> {
  var requestData;
  _RequestAcceptedPageUIState({this.requestData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bola Taxi"),
        backgroundColor: Colors.deepPurpleAccent[400],
      ),
      drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: new MapOptions(
              center: new LatLng(27.7083355, 85.3131555),
              zoom: 13.0,
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
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(27.7083355, 85.3131555),
                    builder: (ctx) => new Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.deepPurpleAccent[400],
                            size: 40.0,
                          ),
                        ),
                  )
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
                        Icons.thumb_up,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                      label: Text(
                        "Request Completed",
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
}
