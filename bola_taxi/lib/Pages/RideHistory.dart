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
  List<Map> _rideHistoryData = [
    {
      "origin": "Bhaktapur",
      "destination": "Kathmandu",
      "rider_name": "Raja Ram",
      "date": "1990/02/02",
      "taxi_no": "BA14PA"
    },
    {
      "origin": "Kathmandu",
      "destination": "Bhaktapur",
      "rider_name": "Raja Ram",
      "date": "1990/02/02",
      "taxi_no": "BA14PA"
    }
  ];
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemBuilder: _buildRideHistory,
              itemCount: _rideHistoryData.length,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRideHistory(BuildContext context, int index) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("Ride History 3"),
          subtitle: Text(
              "Origin: ABC, Destination: ktm, Riderdetail: rambahadur, date: ,taxi_no: ba 1 ja 2265 "),
        )
      ]),
    );
  }
}
