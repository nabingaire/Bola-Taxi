import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:bola_taxi/Models/active_ride_modal.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: DriversHomeUI(data: data),
      ),
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
  List<ActiveRideModal> _activeRequestsList = [];

  _DriversHomeUIState({this.driversData}) {
    //Get all active requests data
    String url = "/request/getActiveRequests.php";
    HttpHelper http = HttpHelper();
    // var _rideHistoryData = json.decode(http.post(url));
    http.get(url).then((val) => setState(() {
          print(val);
          getActiveRequestsData(val);
        }));
  }

  getActiveRequestsData(activeRequestsData) {
    // var _rideHistoryData = jsonObj.toString();
    int count = 0;

    for (var u in activeRequestsData) {
      ActiveRideModal activeRide = ActiveRideModal(
          int.parse(activeRequestsData[count]["request_id"]),
          activeRequestsData[count]["name"],
          activeRequestsData[count]["origin"],
          activeRequestsData[count]["destination"],
          activeRequestsData[count]["origin_name"],
          activeRequestsData[count]["destination"],
          activeRequestsData[count]["phone"],
          activeRequestsData[count]["request_time"],
          driversData["d_id"],
          activeRequestsData[count]["u_id"]);
      _activeRequestsList.add(activeRide);
      count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Active Requests",
        ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent[400],
      ),
      drawer: MenuDrawer(),
      body: Center(
          child: ListView.builder(
        itemBuilder: _buildActiveRequest,
        itemCount: _activeRequestsList.length,
      )),
    );
  }

  Widget _buildActiveRequest(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(_activeRequestsList[index].originName +
                " - " +
                _activeRequestsList[index].destinationName),
            subtitle: Text("Phone: " +
                _activeRequestsList[index].phoneNumber +
                "\nRequested Time: " +
                _activeRequestsList[index].date),
          )
        ]),
      ),
      onTap: () {
        NavigationHelper(context)
            .goToAcceptPage(args: _activeRequestsList[index]);
      },
    );
  }
}