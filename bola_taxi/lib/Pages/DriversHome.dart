import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DriversHome extends StatefulWidget {
  var data;
  DriversHome({this.data});

  @override
  _DriversHomeState createState() => _DriversHomeState(data: data);
}

class _DriversHomeState extends State<DriversHome> {
  var data;
  _DriversHomeState({this.data});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DriversHomeUI(data: data),
    );
  }
}

class DriversHomeUI extends StatefulWidget {
  var data;
  DriversHomeUI({this.data});

  @override
  _DriversHomeUIState createState() => _DriversHomeUIState(driversData: data);
}

class _DriversHomeUIState extends State<DriversHomeUI> {
  var driversData;

  //Active Rides List
  List<> _activeRequestsList;

  _DriversHomeUIState({this.driversData}) {
    //Get all active requests data
    String url = "/request/getcompletedrequestdata.php";
    HttpHelper http = HttpHelper();
    // var _rideHistoryData = json.decode(http.post(url));
    http.get(url).then((val) => setState(() {
          getActiveRequestsData(val);
        }));
  }

  getActiveRequestsData(activeRequestsData) {
    // var _rideHistoryData = jsonObj.toString();
    int count = 0;

    for (var u in activeRequestsData) {
      ActiveRidesModal activeRide = ActiveRidesModal(
          int.parse(activeRequestsData[count]["completed_request_id"]),
          activeRequestsData[count]["origin"],
          activeRequestsData[count]["destination"],
          activeRequestsData[count]["name"],
          activeRequestsData[count]["completed_time"],
          activeRequestsData[count]["taxi_no"]);
      _activeRequestsList.add(activeRide);
      count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bola Taxi",
          ),
          backgroundColor: Colors.deepPurpleAccent[400],
        ),
        drawer: MenuDrawer(),
        body: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text("Origin: baneshwor" +
                    " " +
                    "Destination: koteshwor" +
                    " " +
                    "\n Phone: 9844785589 " +
                    "Requested time: 12:53:02"),
              )
            ],
          ),
        ));
  }
}
