import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class AcceptPage extends StatefulWidget {
  @override
  _AcceptPageState createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: new Text("Bola Taxi"),
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
          new SizedBox(
            height: 240,
            width: double.infinity,
            child: FlutterMap(
                options: new MapOptions(
                  center: LatLng(27.7083355, 85.3131555),
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
<<<<<<< HEAD
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
                  ]),
                
            ),
            Card(
              child: Column(mainAxisSize: MainAxisSize.max,
=======
                ]),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
>>>>>>> 6c350f054ff39fc7aa46343d42109a5077fefb7d
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Users Information"),
                  subtitle: Text("Name: Nabin Gaire" +
                      " " +
                      " Mobile: 9844785589" +
                      " \n Origin: gyaneshwor" +
                      " " +
                      "Destination: baneshwor"),
                ),
<<<<<<< HEAD
                

              ],),
              
            ),
             Container(
            child: RaisedButton(
                
                
                  onPressed: (){},
                  
                  child: Row(children: <Widget>[
                    Text("Accept Job",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Icon(Icons.check_circle)
                  ],
                  ),
                  color: Colors.deepPurpleAccent[400],
                 padding: EdgeInsets.fromLTRB(50,10,50,10),
                  
                ),
                padding: EdgeInsets.fromLTRB(60, 30, 60,0),
            ),
            Container(
            child: RaisedButton(
                
                
                  onPressed: (){},
                  
                  child: Row(children: <Widget>[
                    Text("Pass",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Icon(Icons.close)
                  ],
                  ),
                  color: Colors.red,
                 padding: EdgeInsets.fromLTRB(50,10,50,10),
                  
                ),
                padding: EdgeInsets.fromLTRB(60, 30, 60,0),
            )
          ],
      
=======
              ],
            ),
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.white,
                ),
                color: Colors.deepPurpleAccent[400],
                onPressed: () {},
                label: Text(
                  "Accept Job",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
>>>>>>> 6c350f054ff39fc7aa46343d42109a5077fefb7d
          ),
          Container(
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.white,
                ),
                color: Colors.red,
                onPressed: () {},
                label: Text(
                  "Pass Job",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          )
        ],
      ),
    );
  }
}
