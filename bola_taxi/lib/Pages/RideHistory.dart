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
    String url = "\request\getcompletedrequestdata.php";
    HttpHelper http = HttpHelper();
    // var _rideHistoryData = json.decode(http.post(url));
    http.post(url).then((val) => setState(() {
          getUsers(val);
        }));
  }
  
  getUsers(jsonObj) {
    var _rideHistoryData = json.decode(jsonObj);
    // for (var u in _rideHistoryData) {
    //   RideHistoryModal rideHistory = RideHistoryModal(
    //       _rideHistoryData["index"],
    //       _rideHistoryData["origin"],
    //       _rideHistoryData["destination"],
    //       _rideHistoryData["rider_name"],
    //       _rideHistoryData["date"],
    //       _rideHistoryData["taxi_no"]);
    //   _rideHistoryList.add(rideHistory);
    // }

    print(_rideHistoryData.length);
  }

  List<String> rideData = ["Nepal", "China"];

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
      body: new Center(
          child: ListView.builder(
        itemBuilder: _buildRideHistory,
        itemCount: rideData.length,
      )),
    );
  }

  Widget _buildRideHistory(BuildContext context, int index) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text(rideData[index]),
          subtitle: Text(
              "Origin: ABC, Destination: ktm, Riderdetail: rambahadur, date: ,taxi_no: ba 1 ja 2265 "),
        )
      ]),
    );
  }
}
