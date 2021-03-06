import 'package:bola_taxi/Pages/AcceptPage.dart';
import 'package:bola_taxi/Pages/DriversHome.dart';
import 'package:bola_taxi/Pages/LoginChoice.dart';
import 'package:bola_taxi/Pages/LoginDriver.dart';
import 'package:bola_taxi/Pages/LoginPassenger.dart';
import 'package:bola_taxi/Pages/PassengersHome.dart';
import 'package:bola_taxi/Pages/PaymentPage.dart';
import 'package:bola_taxi/Pages/RequestAcceptedPage.dart';
import 'package:bola_taxi/Pages/RideHistory.dart';
import 'package:bola_taxi/Pages/SignUpPassenger.dart';
import 'package:bola_taxi/Pages/SignupChoice.dart';
import 'package:bola_taxi/Pages/UserProfile.dart';
import 'package:bola_taxi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bola_taxi/Pages/SignUpDriver.dart';

class NavigationHelper {
  //Get Context From Constructor
  BuildContext context;
  NavigationHelper(this.context);

  /* =================== Drivers ============== */
  goToDriverSignup({args}) {
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => SignUpDriver()));
  }

  goToDriversLogin({args}) {
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => LoginDriver()));
  }

  goToDriversHome({args}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DriversHome(data: args)));
  }

  goToAcceptPage({args}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AcceptPage(data: args)));
  }

  goToRequestAcceptedPage({args}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RequestAcceptedPage(data: args)));
  }

  /* =================== Passengers ============== */

  goToPassengersSignUp({args}) {
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => SignUpPassenger()));
  }

  goToPassengersLogin({args}) {
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => LoginPassenger()));
  }

  goToPassengersHome({args}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PassengersHome(data: args)));
  }

  goTOUserProfile({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserProfile()));
  }

  goToLoginChoice({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginChoice()));
  }

  goToSignUpChoice({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpChoice()));
  }

  goToPaymentOptions({args}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaymentPage()));
  }

  goToRideHistory({args}){
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => RideHistory()));
  }

  // goToMain({args}){
  //   Navigator.push(context,
  //   MaterialPageRoute(builder: (context)=> HomePage()));
  // }
}
