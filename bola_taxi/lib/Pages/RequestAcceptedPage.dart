import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/lat-lng-helper.dart';
import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:bola_taxi/Models/active_ride_modal.dart';
import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class RequestAcceptedPage extends StatefulWidget {
  ActiveRideModal data;
  RequestAcceptedPage({this.data});
  @override
  _RequestAcceptedPageState createState() =>
      _RequestAcceptedPageState(data: data);
}

class _RequestAcceptedPageState extends State<RequestAcceptedPage> {
  ActiveRideModal data;
  _RequestAcceptedPageState({this.data});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RequestAcceptedPageUI(data: data),
    );
  }
}

class RequestAcceptedPageUI extends StatefulWidget {
  ActiveRideModal data;
  RequestAcceptedPageUI({this.data});
  @override
  _RequestAcceptedPageUIState createState() =>
      _RequestAcceptedPageUIState(requestData: data);
}

class _RequestAcceptedPageUIState extends State<RequestAcceptedPageUI> {
  ActiveRideModal requestData;
  _RequestAcceptedPageUIState({this.requestData});

  @override
  Widget build(BuildContext context) {
    String origin = requestData.origin;
    LatLngHelper latLngHelper = new LatLngHelper(origin);

    double latitude = latLngHelper.getLatitude();
    double longitude = latLngHelper.getLongitude();

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
              center: new LatLng(latitude, longitude),
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
                    point: LatLng(latitude, longitude),
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
                        _areYouSurePrompt(context);
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

  _addDataToCompletedRequests() {
    String url = "/request/completed_request.php";
    Object completedRequest = {
      "t_id": requestData.driverId,
      "u_id": requestData.passangerId,
      "origin": requestData.origin,
      "destination": requestData.destination,
      "request_id": requestData.index
    };

    HttpHelper().post(url,body: completedRequest).then((val) => setState(() {
          print(val);
        }));
  }

  _areYouSurePrompt(requestObj) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                _addDataToCompletedRequests();
                NavigationHelper(context).goToDriversHome();
              },
            ),
          ],
        );
      },
    );
  }
}
