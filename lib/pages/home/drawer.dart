import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gsm_mall/pages/Category/category_main.dart';
import 'package:gsm_mall/pages/Category/maincategory.dart';
import 'package:gsm_mall/pages/cart.dart';
import 'package:gsm_mall/pages/faq_and_about_app/about_app.dart';
import 'package:gsm_mall/pages/faq_and_about_app/faq.dart';
import 'package:gsm_mall/pages/login_signup/login.dart';
//import 'package:gsm_mall/authenticate/login.dart';

import 'package:gsm_mall/pages/my_account/my_account.dart';
import 'package:gsm_mall/pages/my_orders.dart';
import 'package:gsm_mall/pages/notification.dart';
import 'package:gsm_mall/pages/wishlist.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Logout AlertDialog Start Here
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text(
              "Confirm",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("Are you Sure you want to Logout?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              FlatButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
    // Logout AlertDialog Ends Here

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              
           child: Container(
              height: 150.0,
              
              decoration: BoxDecoration(
                
                image: new DecorationImage(image: new AssetImage('assets/containerback.jpg'),
                fit: BoxFit.cover,
                ),
                
                borderRadius: BorderRadius.circular(0),
                
                
              ),
             child: Center(
                child: Text(
                "LOGIN . SIGNUP    >",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
             ),
            ),
            onTap: (){
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
            },
            ),
            SizedBox(
                      height: 10.0,
                    ),

            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      EvaIcons.grid,
                      color: Colors.grey[700],
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Shop By Catogories',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
               /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Maincategory()),
                );*/
              },
            ),
            Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                        
            ),

           InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
                child: Text(
                      'MEN',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryMain()),
                );
              },
            ),

            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
                child: Text(
                      'WOMEN',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatogeryFemale()),
                );
              },
            ),

            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
                child: Text(
                      'KIDS',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryKids()),
                );
              },
            ),
            

            Divider(
              height: 10,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
            ),
          
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Orders',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrders()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.shoppingBag,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Bag',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Wishlist',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
               /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAccount()),
                );*/
              },
            ),

          /*  InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Notification',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
            ),
            */

            Divider(
              color: Colors.grey,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqPage()),
                );*/
              },
            ),
           
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                _showDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}
