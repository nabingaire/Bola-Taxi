import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: _PaymentPageUI(),
        ),
        );
        
  }
}
class  _PaymentPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Center(
     child: Container(
       child: Column(
         children: <Widget>[
           Text("Tap a payment option",
           style: TextStyle(fontSize: 30,
           color: Colors.black
           ),
           
           ),
           Container(
            child: GestureDetector(
             onTap: _launchURL1,
                child: Image.asset("assets/images/esewa.png",height: 150,)
              
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
           ),
           Container(
            child: GestureDetector(
             onTap: _launchURL2,
                child: Image.asset("assets/images/khalti.png",height: 150,)
              
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
           ),
          Container(
            child: GestureDetector(
             onTap: _launchURL3,
                child: Image.asset("assets/images/imepay.png",height: 150,)
              
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
           )


         ],
       ),

     ) 
   );



  }
}
_launchURL1() async{
 const url1 = 'https://esewa.com.np/#/home';
  if (await canLaunch(url1)) {
      await launch(url1);
    } else {
      throw 'Could not launch $url1';
    }
   
}
_launchURL2() async{
  const url2 = 'https://khalti.com/';
   if (await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url2';
    }
   
}
_launchURL3() async{
  const url3 = 'http://www.imepay.com.np/';
   if (await canLaunch(url3)) {
      await launch(url3);
    } else {
      throw 'Could not launch $url3';
    }
   
}


