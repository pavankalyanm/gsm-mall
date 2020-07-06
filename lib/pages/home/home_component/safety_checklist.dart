import 'package:flutter/material.dart';

class SafetyChecklist extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width;

    return Container(
      width: width,
      height: 170.0,
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
       
        children: <Widget>[
          
              // banner ad slider
              
               SizedBox(
                height: 150,
              
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(width:10),
                    Container(
                width: 160.0,
                
                child: Center(
                    child: Image.asset("assets/banner5.jpeg",fit: BoxFit.fill,)
                    
                ),
              ),
              SizedBox(width:10),
              Container(
                width: 160.0,
               
                child: Center(
                    child: Image.asset('assets/banner6.jpeg',fit: BoxFit.fill),
                ),
              ),
              SizedBox(width:10),
              Container(
                width: 160.0,
                
                child: Center(
                    child: Image.asset('assets/banner8.jpeg'),
                ),
              ),
              SizedBox(width:10),
              Container(
                width: 160.0,
                
                child: Center(
                    child:Image.asset('assets/banner7.jpeg'),
                ),
              ),
              SizedBox(width:10),
             

                  ]
              ),
             ),
          

        ],
      ),
    );
  }
}