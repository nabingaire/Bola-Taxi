import 'dart:convert';

import 'package:bola_taxi/Helper/distance-helper.dart';
import 'package:bola_taxi/Helper/fare-helper.dart';
import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/lat-lng-helper.dart';
import 'package:bola_taxi/Helper/location.helper.dart';
import 'package:bola_taxi/Helper/shared-preferences-helper.dart';
import 'package:bola_taxi/Helper/widgets-generator-helper.dart';
import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:vibration/vibration.dart';
import 'dart:async';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: PassengerHomeUI(data: data),
      ),
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
  double currentLocationLat;
  double currentLocationLong;
  var passangerData;
  _PassengerHomeUIState({this.passangerData});

  //Request ID
  int _requestId = 0;

  //Data for dialog
  String _nameOfDriver;
  String _taxiNo;

  //Tap Count
  int _tapCount = 0;

  //Request sent boolean
  bool _requestSent = false;
  //Dialog has been shown
  bool _dialogShown = false;

  //Show Price
  bool _showPriceContainer = false;

  //Total Fare
  double totalFare = 0;

  //Calculate total distance
  double totalDistance = 0;

  //Pin Location Name
  String locationName = "Bola Taxi";

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
    //Check if request has been accepted by any driver
    if (_requestSent && !_dialogShown) {
      const pollingTime = Duration(seconds: 5);
      const String activeRequestsAPIUrl =
          "/request/getAcceptedRequestDataByRequestId.php";
      Object activeRequestsAPIObj = {"request_id": 33};
      Timer.periodic(
          pollingTime,
          (Timer t) => {
                HttpHelper()
                    .post(activeRequestsAPIUrl, body: activeRequestsAPIObj)
                    .then((value) => setState(() {
                          if (value[0]["response_code"] == 200) {
                            _nameOfDriver = value[0]["name"];
                            _taxiNo = value[0]["taxi_no"];
                            _showDriverAcceptedRequestNotification();
                            _setDialogShownTo(true);
                            t.cancel();
                          }
                        }))
              });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(locationName),
        backgroundColor: _buttonBackgroundColorsList[_tapCount],
      ),
      drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: new MapOptions(
              center: new LatLng(27.7083355, 85.3131555),
              zoom: 13.0,
              onTap: (LatLng point) {
                // currentLocationLat = LatLngHelper(point.t).getLatitude();
                _handleTap(point, context);
                setState(() {
                  _setLocationName(point);
                });
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
          if (_showPriceContainer) ...[
            Container(
              child: Center(
                child: Align(
                  alignment: Alignment(1.0, 0.83),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Rs. " + totalFare.round().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                        color: Colors.black.withOpacity(0.3)),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            )
          ],
          Container(
            child: Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
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

                          if (_tapCount == 2) {
                            setState(() {
                              totalDistance = _getDistance(
                                  _locationDestinationLatLngList[0].latitude,
                                  _locationDestinationLatLngList[0].longitude,
                                  _locationDestinationLatLngList[1].latitude,
                                  _locationDestinationLatLngList[1].longitude);
                              totalFare = _getFareFromDistance(totalDistance);
                              print(totalDistance);
                              print("Total Fare");
                              print(totalFare);
                              _showPriceContainer = true;
                            });
                          }

                          if (_tapCount == 3) {
                            _sendDataToRequestDB();
                            _showRideOnTheWayToast(context);
                            print("Fare From distance");
                          }

                          //On Cancel Request
                          if (_tapCount == 4) {
                            _cancelPickUpRequest();
                            _showRequestHasBeenCancelledToast(context);
                            _showPriceContainer = false;
                          }
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
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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

    String originName;
    String destinationName;

    LocationHelper()
        .getLocationNameFromLatLng(_locationDestinationLatLngList[0].latitude,
            _locationDestinationLatLngList[0].longitude)
        .then((value) {
      originName = value;
      LocationHelper()
          .getLocationNameFromLatLng(_locationDestinationLatLngList[1].latitude,
              _locationDestinationLatLngList[1].longitude)
          .then((value) {
        destinationName = value;

        Object _dataObj = {
          "u_id": passangerData["u_id"],
          "origin": _locationDestinationLatLngList[0].latitude.toString() +
              "," +
              _locationDestinationLatLngList[0].longitude.toString(),
          "destination": _locationDestinationLatLngList[1].latitude.toString() +
              "," +
              _locationDestinationLatLngList[1].longitude.toString(),
          "origin_name": originName,
          "destination_name": destinationName,
          "request_time": (DateTime.now()).toString(),
          "status": "pending"
        };
        HttpHelper().post(url, body: _dataObj).then((val) => setState(() {
              print(val);
              _setRequestSentTo(true);
              _requestId = int.parse(val["request_id"]);
              print(_requestId);
            }));
      });
    });
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
                _setDialogShownTo(false);
                _setRequestSentTo(false);
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

  _showDriverAcceptedRequestNotification() {
    _vibrate();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("A driver is on his way!!"),
          content: new Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
                text: _nameOfDriver,
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " is coming to pick you up. His Taxi Number is: "),
            TextSpan(
                text: _taxiNo, style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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

  _setRequestSentTo(bool value) {
    _requestSent = value;
  }

  _setDialogShownTo(bool value) {
    _dialogShown = value;
  }

  _vibrate() {
    Vibration.hasVibrator().then((value) {
      Vibration.vibrate();
    });
  }

  String _setLocationName(LatLng point) {
    double lat = point.latitude;
    double lon = point.longitude;
    LocationHelper().getLocationNameFromLatLng(lat, lon).then((value) {
      locationName = value;
    });
    return locationName;
  }

  _getDistance(originLat, originLon, destinationLat, destinationLon) {
    //Get Fare
    return DistanceHelper().calculateDistance(
        originLat, originLon, destinationLat, destinationLon);
  }

  _getFareFromDistance(distanceInMeters) {
    return FareHelper().getFare(distanceInMeters);
  }

  _showPayWithKhaltiDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Payment"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
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
