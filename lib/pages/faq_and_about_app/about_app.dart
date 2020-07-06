import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'ABOUT STYLO APP',
          style: TextStyle(
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.7,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('STYLO Fashion Ecommerce App UI in Flutter',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('STYLO is a multipurpose ecommerce app ui template. STYLO is built in flutter. Flutter is a Hybrid App Development Platform. So, STYLO Compatible with Android and iOs both.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('STYLO is a developed by Render Code. We are expert flutter developer team.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Thanks for Installing our App',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                  ),
                ),

                Divider(height: 1.0,),

                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('render_code',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}