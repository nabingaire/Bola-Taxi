import 'dart:convert';

import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/widgets-generator-helper.dart';
import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PassengersHome extends StatefulWidget {
  var data;
  PassengersHome({this.data});

  @override
  _PassengersHomeState createState() {
    return _PassengersHomeState(data: data);
  }
}

class _PassengersHomeState extends State<PassengersHome> {
  var data;
  _PassengersHomeState({this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PassengerHomeUI(data: data),
    );
  }
}

class PassengerHomeUI extends StatefulWidget {
  var data;
  PassengerHomeUI({this.data});

  @override
  _PassengerHomeUIState createState() =>
      _PassengerHomeUIState(passangerData: data);
}

class _PassengerHomeUIState extends State<PassengerHomeUI> {
  var passangerData;
  _PassengerHomeUIState({this.passangerData});

  //Tap Count
  int _tapCount = 0;

  //Color
  List<Color> _buttonBackgroundColorsList = [
    Colors.deepPurpleAccent[400],
    Colors.indigo,
    Colors.green,
    Colors.red,
    Colors.deepPurpleAccent[400],
  ];

  //Icon
  List<IconData> _buttonIconList = [
    Icons.arrow_upward,
    Icons.arrow_downward,
    Icons.thumb_up,
    Icons.cancel,
    Icons.arrow_upward
  ];

  //Text
  List<String> _textList = [
    "Pick me up",
    "Drop me here",
    "Confirm",
    "Cancel Pickup ",
    "Pick me up"
  ];

  //Markers
  List<Marker> _mapMarkers = [];

  //LatLng
  List<LatLng> _locationDestinationLatLngList = [];

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
                          if (_tapCount != 4) {
                            _tapCount++;
                          }

                          if (_tapCount == 3) {
                            _sendDataToRequestDB();
                            _showRideOnTheWayToast(context);
                          }

                          //On Cancel Request
                          if (_tapCount == 4) {
                            _cancelPickUpRequest();
                            _showRequestHasBeenCancelledToast(context);
                          }
                          print("Tap Count:");
                          print(_tapCount);
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
          _locationDestinationLatLngList.removeAt(_tapCount);
          _mapMarkers.removeAt(_tapCount);
        } catch (e) {
          print(e.toString());
        }

        _locationDestinationLatLngList.insert(_tapCount, point);
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
      }
    });
  }

  _sendDataToRequestDB() {
    String url = "/request/request.php";

    Object _dataObj = {
      "u_id": passangerData["u_id"],
      "origin": _locationDestinationLatLngList[0].latitude.toString() +
          "," +
          _locationDestinationLatLngList[0].longitude.toString(),
      "destination": _locationDestinationLatLngList[1].latitude.toString() +
          "," +
          _locationDestinationLatLngList[1].longitude.toString(),
      "request_time": (DateTime.now()).toString(),
      "status": "pending"
    };

    print(_dataObj);
    HttpHelper().post(url, body: _dataObj).then((val) => setState(() {
          print(val);
        }));
  }

  _showRideOnTheWayToast(BuildContext context) {
    WidgetsGeneratorHelper(context)
        .showSnackBar("You request has been sent out to the drivers!");
  }

  _clearLocationDestinationLatLngList() {
    _locationDestinationLatLngList.clear();
  }

  _clearMarkerList() {
    _mapMarkers.clear();
  }

  _resetIndex() {
    _tapCount = 0;
  }

  _cancelPickUpRequest() {
    String url = "/request/deleterequest.php";

    Object dataObj = {"u_id": _getPassengerUID()};

    HttpHelper().post(url, body: dataObj).then(
          (value) => setState(() {
                _clearLocationDestinationLatLngList();
                _resetIndex();
                _clearMarkerList();
                print(_mapMarkers);
              }),
        );
  }

  _getPassengerUID() {
    return passangerData["u_id"];
  }

  _showRequestHasBeenCancelledToast(context) {
    WidgetsGeneratorHelper(context)
        .showSnackBar("Your Request has been cancelled");
  }
}
