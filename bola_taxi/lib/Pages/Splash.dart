import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: _SplashUI(),
    );
  }
}
class _SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/splash.png',
              height: 736,
              width: 736,
            ),
       
         ],
        ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      
      ),
    );
  }
}