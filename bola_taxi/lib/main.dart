
import 'package:bola_taxi/Pages/DriversHome.dart';
import 'package:bola_taxi/Pages/PassengersHome.dart';
import 'package:bola_taxi/Pages/RideHistory.dart';
import 'package:bola_taxi/Pages/SignUpDriver.dart';
import 'package:bola_taxi/Pages/SignUpPassenger.dart';
import 'package:bola_taxi/Pages/SignupChoice.dart';
import 'package:bola_taxi/Pages/SignupPassenger.dart';
import 'package:bola_taxi/Pages/Splash.dart';
import 'package:bola_taxi/pages/Login.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PassengersHome(),
      ),
    );
  }
}
