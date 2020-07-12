import 'package:flutter/material.dart';
import 'package:gsm_mall/models/user.dart';
import 'package:gsm_mall/pages/home/home_main.dart';
import 'package:gsm_mall/pages/login_signup/login.dart';
import 'package:gsm_mall/pages/login_signup/signup.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<User>(context);
   
    if (user==null){
      return Login();

    }else{
      return HomeMain();
    }
    
  }
}