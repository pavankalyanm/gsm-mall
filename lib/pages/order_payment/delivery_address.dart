import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gsm_mall/pages/order_payment/payment.dart';

// My Own Imports

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD ADDRESS',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Jost',
            fontSize: 18.0,
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CONTACT DETAILS',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    //  fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      height: 1.6),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                 height: 10,
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile No.*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                
                child:Text(
                  'ADDRESS',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    //  fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      height: 1.6),
                  textAlign: TextAlign.center,
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pin Code*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address(House No, Building,Street)',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Locality/Town*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 10.0,
                  
                ),
                Container(
                  height: 50,
                  width: width - 40.0,
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   new Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'City*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                   ),
                   SizedBox(
                         width:10 ,
                   ),
                   new Flexible(
                     child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'State*',
                      labelStyle: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                   )
               ],)
                ),
                SizedBox(
                  height: 20.0,
                  
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: PaymentPage()));
                    },
                    child: Container(
                      width: width - 40.0,
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'PAYMENT',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
