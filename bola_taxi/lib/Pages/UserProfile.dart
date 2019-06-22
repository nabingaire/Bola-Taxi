import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _UserProfileUI(),
      
    );
   
  }
}
class _UserProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   new Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text("User Profile"),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
          ),
        ),
        body: new Stack(
          children: <Widget>[
            
            
            Center(
              // width: 300.0,
              // top: MediaQuery.of(context).size.height / 12,
              child: Column(
                children: <Widget>[
                  Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/images/pp.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(120.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ]
                          )
                          ),
                          new Container(
                            height: 1.0,
                            width: 300.0,
                            color: Colors.black,
                            margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 80),
                          ),
                          

                          ListTile(   
                            trailing: Icon(Icons.edit),                    
                               title: Text(
                                 "Nabin Gaire",
                                 style: TextStyle(
                                   fontSize: 30.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 ),
                            ) ,
                             ListTile(   
                            trailing: Icon(Icons.edit), 
                            leading: Icon(Icons.phone),                   
                               title: Text(
                                 "9844785589",
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 ),
                            ) ,
                            
                ],
              ),
            )
            
            ],
        )
        );
  }
}
