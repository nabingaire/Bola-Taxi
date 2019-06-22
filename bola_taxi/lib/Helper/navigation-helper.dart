import 'package:bola_taxi/Pages/DriversHome.dart';
import 'package:bola_taxi/Pages/PassengersHome.dart';
import 'package:bola_taxi/Pages/SignUpPassenger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bola_taxi/Pages/SignUpDriver.dart';

class NavigationHelper {
  //Get Context From Constructor
  BuildContext context;
  NavigationHelper(this.context);

  goToDriverSignup({args}) {
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => SignUpDriver()));
  }

  goToPassengersSignUp({args}) {
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => SignUpPassenger()));
  }

  goToDriversHome({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DriversHome()));
  }

  goToPassengersHome({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PassengersHome()));
  }
}
