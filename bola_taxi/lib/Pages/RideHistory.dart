import 'dart:convert';

import 'package:bola_taxi/Helper/http-helper.dart';
import 'package:bola_taxi/Models/ride_history_modal.dart';
import 'package:flutter/material.dart';

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    return RideHistoryUI();
  }
}

class RideHistoryUI extends StatefulWidget {
  @override
  _RideHistoryUIState createState() => _RideHistoryUIState();
}

class _RideHistoryUIState extends State<RideHistoryUI> {
  List<RideHistoryModal> _rideHistoryList = [];

  _RideHistoryUIState() {
    String url = "/request/getcompletedrequestdata.php";
    HttpHelper http = HttpHelper();
    // var _rideHistoryData = json.decode(http.post(url));
    http.get(url).then((val) => setState(() {
          getUsers(val);
        }));
  }

  getUsers(rideHistoryList) {
    // var _rideHistoryData = jsonObj.toString();
    int count = 0;

    for (var u in rideHistoryList) {
      RideHistoryModal rideHistory = RideHistoryModal(
          int.parse(rideHistoryList[count]["completed_request_id"]),
          rideHistoryList[count]["origin"],
          rideHistoryList[count]["destination"],
          rideHistoryList[count]["name"],
          rideHistoryList[count]["completed_time"],
          rideHistoryList[count]["taxi_no"]);
      _rideHistoryList.add(rideHistory);
      count++;
    }
  }


  @override
  Widget build(BuildContext context) {
    // getUsers();
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text("Ride History"),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          iconSize: 35,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurpleAccent[400],
      ),
      body:  Center(
          child: ListView.builder(
        itemBuilder: _buildRideHistory,
        itemCount: _rideHistoryList.length,
      )),
    );
  }

  Widget _buildRideHistory(BuildContext context, int index) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text(_rideHistoryList[index].origin +
              " - " +
              _rideHistoryList[index].destination),
          subtitle: Text("Driver Name: " +
              _rideHistoryList[index].riderName +
              "\nTaxi No: " +
              _rideHistoryList[index].taxiNo +
              "\nTime: " +
              _rideHistoryList[index].date),
        )
      ]),
    );
  }
}
