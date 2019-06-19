// import 'package:bola_taxi/Pages/SignUpDriver.dart';
// import 'package:bola_taxi/Pages/SignupChoice.dart';
// import 'package:flutter/material.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Getting arguments passed in while calling Navigator.pushNamed
//     final args = settings.arguments;

//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => SignUpChoice());
//       case '/signup-driver':
//           return MaterialPageRoute(
//             builder: (_) => SignUpDriver(
//                   data: args,
//                 ),
//           );
        
//       default:
//         // If there is no such named route in the switch statement, e.g. /third
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }