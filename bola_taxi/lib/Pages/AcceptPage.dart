import 'package:bola_taxi/Models/active_ride_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class AcceptPage extends StatefulWidget {
  ActiveRideModal data;
  AcceptPage({this.data});
  @override
  _AcceptPageState createState() => _AcceptPageState(requestObj: data);
}

class _AcceptPageState extends State<AcceptPage> {
  ActiveRideModal requestObj;
  _AcceptPageState({this.requestObj});
  @override
  Widget build(BuildContext context) {
    print(_getOriginLatitude());
    print(_getOriginLongitude());
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text("Bola Taxi"),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          iconSize: 35,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurpleAccent[400],
      ),
      body: Column(
        children: <Widget>[
          new SizedBox(
            height: 240,
            width: double.infinity,
            child: FlutterMap(
                options: new MapOptions(
                  center: LatLng(_getOriginLatitude(), _getOriginLongitude()),
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
                        point:
                            LatLng(_getOriginLatitude(), _getOriginLongitude()),
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
                ]),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.info),
                  title:
                      Text(requestObj.origin + " - " + requestObj.destination),
                  subtitle: Text.rich(TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Name: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: requestObj.name),
                    TextSpan(
                        text: " Mobile: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: requestObj.phoneNumber),
                  ])),
                )
              ],
            ),
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.white,
                ),
                color: Colors.deepPurpleAccent[400],
                onPressed: () {
                  _acceptJob();
                },
                label: Text(
                  "Accept Job",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.white,
                ),
                color: Colors.red,
                onPressed: () {
                  _passJob();
                },
                label: Text(
                  "Pass Job",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          )
        ],
      ),
    );
  }

  _getOriginLongitude() {
    String lat = _convertLatLngStringToList(_getOrigin())[1];
    return double.parse(lat);
  }

  _getOriginLatitude() {
    String lat = _convertLatLngStringToList(_getOrigin())[0];
    return double.parse(lat);
  }

  _getOrigin() {
    return requestObj.origin;
  }

  _getDestination() {
    return requestObj.destination;
  }

  List<String> _convertLatLngStringToList(value) {
    return value.split(",");
  }

  _acceptJob() {
    Object acceptedRequestsObj = {
      "driver_id": requestObj.driver_id,
      "request_id": requestObj.index
    };
    _areYouSurePrompt();
    print(acceptedRequestsObj);
  }

  void _passJob() {
    Navigator.pop(context);
  }

  _areYouSurePrompt() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure?"),
          content: new Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text:
                  "Are you sure want to pick up the passenger? Failing to do so will lead ",
            ),
            TextSpan(
                text: " bad reviews. ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
