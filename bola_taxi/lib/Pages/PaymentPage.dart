import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Payment Options"),
        leading: new IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: new Icon(Icons.arrow_back),
          iconSize: 35,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurpleAccent[400],
      ),
      body: Center(
          child: Container(
        child: Column(children: <Widget>[
          Text("Tap a payment option"),
          Row(
            children: <Widget>[
              Image.asset(
                "assets/images/khalti.png",
                height: 100,
                width: 100,
              ),
              Image.asset(
                "assets/images/imepay.png",
                height: 100,
                width: 100,
              ),
              Image.asset(
                "assets/images/esewa.png",
                height: 100,
                width: 100,
              )
            ],
          ),
        ]),
      )),
    ));
  }
}
