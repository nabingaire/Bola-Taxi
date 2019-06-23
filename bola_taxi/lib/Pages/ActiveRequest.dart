import 'package:bola_taxi/Pages/RideHistory.dart';
import 'package:flutter/material.dart';

class ActiveRequest extends StatefulWidget {
  @override
  _ActiveRequestState createState() => _ActiveRequestState();
}

class _ActiveRequestState extends State<ActiveRequest> {
  @override
  Widget build(BuildContext context) {
    return _ActiveRequestUI();

      }
}

class _ActiveRequestUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text("Active Requests"),
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

      Text(
          "Origin: baneshwor , Destination: koteshwor , phone: 9844785589 , request time: 12:53:00"
        ),


      ],)
      
      
      );
      
    
  }
}

  
 