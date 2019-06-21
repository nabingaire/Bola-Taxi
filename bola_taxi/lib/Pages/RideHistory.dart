import 'dart:convert';

import 'package:bola_taxi/Models/ride_history_modal.dart';
import 'package:flutter/material.dart';

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    return _RideHistoryUI();
  }
}

class _RideHistoryUI extends StatelessWidget {
  // getUsers() {
  //   Object _rideHistoryObj = [
  //     {
  //       "index": 1,
  //       "origin": "Bhaktapur",
  //       "destination": "Kathmandu",
  //       "rider_name": "Raja Ram",
  //       "date": "1990/02/02",
  //       "taxi_no": "BA14PA"
  //     },
  //     {
  //       "index":2,
  //       "origin": "Kathmandu",
  //       "destination": "Bhaktapur",
  //       "rider_name": "Raja Ram",
  //       "date": "1990/02/02",
  //       "taxi_no": "BA14PA"
  //     }
  //   ];
  //   var _rideHistoryData = json.decode(_rideHistoryObj);

  //   List<RideHistoryModal> rideHistoryList = [];

  //   for (var u in _rideHistoryData) {
  //     RideHistoryModal rideHistory = RideHistoryModal(_rideHistoryData["index"],_rideHistoryData["origin"],_rideHistoryData["destination"],_rideHistoryData["rider_name"],_rideHistoryData["date"],_rideHistoryData["taxi_no"]);
  //     rideHistoryList.add(rideHistory);
  //   }

  //   print(rideHistoryList.length);
  // }

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
