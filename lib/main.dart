import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsm_mall/models/cartmodel.dart';

import 'package:gsm_mall/pages/cart.dart';
import 'package:gsm_mall/pages/home/home_main.dart';
import 'package:gsm_mall/pages/login_signup/login.dart';
import 'package:gsm_mall/pages/splashscreen.dart';
import 'package:provider/provider.dart';




void main() {


    runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MultiProvider(
     providers: [
     
      
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
     ],
      child: MaterialApp(
      title: 'GSM MALL',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFFF6666),
        // accentColor: const Color(0xFFFDE400),
        accentColor: Colors.pinkAccent,
        primaryColorLight: const Color(0xFFE60000),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      //theme: new ThemeData.dark(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ),
   );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeMain();
  }
}

/*Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? HomeMain() : Login();
        },);*/