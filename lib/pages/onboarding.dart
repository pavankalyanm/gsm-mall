import 'dart:io';

import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gsm_mall/pages/login_signup/login.dart';

class OnBoardong extends StatefulWidget {
  @override
  _OnBoardongState createState() => _OnBoardongState();
}

class _OnBoardongState extends State<OnBoardong> {

  DateTime currentBackPressTime;
  
  final pageList = [
    PageModel(
      color: const Color(0xFFA36562),
      heroAssetPath: 'assets/onboarding_images/onboarding_1.png',
      title: Text('Welcome To STYLO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: 'Jost',
            letterSpacing: 0.7,
          )),
      body: Text('All Fashion Products at One Shop Stop.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/onboarding_images/onboarding_1.png',
    ),
    PageModel(
      color: Colors.red[300],
      heroAssetPath: 'assets/onboarding_images/onboarding_2.png',
      title: Text('Beautiful UI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: 'Jost',
            letterSpacing: 0.7,
          )),
      body: Text('STYLO is a Beautiful and Perfect UI for Fashion Store.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/onboarding_images/onboarding_2.png',
    ),
    PageModel(
      color: Colors.pink,
      heroAssetPath: 'assets/onboarding_images/onboarding_3.png',
      title: Text('Easy & Secure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25.0,
            fontFamily: 'Jost',
            letterSpacing: 0.7,
          )),
      body: Text('Your Security Matters.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/onboarding_images/onboarding_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: FancyOnBoarding(
        doneButtonText: "LOG IN",
        skipButtonText: "SKIP",
        skipButtonTextStyle: TextStyle(
          fontFamily: 'Jost',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.7,
          color: Colors.white,
        ),
        doneButtonTextStyle: TextStyle(
          fontFamily: 'Jost',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.7,
          color: Colors.white,
        ),
        pageList: pageList,
        onSkipButtonPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: LoginPage()));
        },
        onDoneButtonPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: LoginPage()));
        },
      ),
      onWillPop: onWillPop,
    ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press Back Once Again To Exit");
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }

}
