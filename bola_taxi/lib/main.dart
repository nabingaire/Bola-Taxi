import 'package:bola_taxi/Helper/location.helper.dart';
import 'package:bola_taxi/Helper/navigation-helper.dart';
import 'package:bola_taxi/Helper/shared-preferences-helper.dart';
import 'package:bola_taxi/Pages/AcceptPage.dart';
import 'package:bola_taxi/Pages/ChangeStatus.dart';
import 'package:bola_taxi/Pages/DriversHome.dart';
import 'package:bola_taxi/Pages/LoginChoice.dart';
import 'package:bola_taxi/Pages/LoginDriver.dart';
import 'package:bola_taxi/Pages/LoginPassenger.dart';
import 'package:bola_taxi/Pages/PassengersHome.dart';
import 'package:bola_taxi/Pages/ResetPassword.dart';
import 'package:bola_taxi/Pages/ResetRequest.dart';
import 'package:bola_taxi/Pages/RideHistory.dart';
import 'package:bola_taxi/Pages/SignUpDriver.dart';
import 'package:bola_taxi/Pages/SignUpPassenger.dart' as prefix0;
import 'package:bola_taxi/Pages/SignupChoice.dart';
import 'package:bola_taxi/Pages/SignupPassenger.dart';
import 'package:bola_taxi/Pages/Splash.dart';
import 'package:bola_taxi/Pages/UserProfile.dart';
import 'package:flutter/foundation.dart';
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
        body: LoginChoice(),        
      ),
    );
  }
}
