import 'package:flutter/material.dart';
import 'package:gsm_mall/pages/login_signup/login.dart';
//import 'package:gsm_mall/authenticate/login.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    ListTile getListTile(title) {

      // Widget for common ListTile
      return ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {},
      );
    }

    // Widget for common divider
    Padding getDivider() {
      return Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Divider(
          height: 1.0,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'ACCOUNT SETTING',
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
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Account',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Address'),
                getDivider(),
                getListTile('Telephone'),
                getDivider(),
                getListTile('Email'),
                getDivider(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Setting',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Order Notifications'),
                getDivider(),
                getListTile('Discount Notifications'),
                getDivider(),
                getListTile('Credit Card'),
                getDivider(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
