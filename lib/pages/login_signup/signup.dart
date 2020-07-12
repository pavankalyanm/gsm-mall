import 'package:flutter/material.dart';

import 'package:gsm_mall/pages/login_signup/login.dart';
import 'package:gsm_mall/pages/home/home_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsm_mall/authenticate/authservice.dart';
import 'package:gsm_mall/widgets/loading.dart';

class Signup extends StatefulWidget {
  final Function widview;
  Signup({this.widview});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey= GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  
  //String fname="";
  String dname="";
  String error="";
  String email="";
  String password="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
  return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 75,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Text("SIGNUP", style: TextStyle( fontSize: 30,fontFamily: 'Jost'),)),
                  SizedBox(height: 20,),
                 Container(
                    
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: <Widget>[       
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[200]
                            ))
                          ),
                          child: TextFormField(
                             validator: (val)=>val.isEmpty ? 'Enter Display Name':null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "DisplayName*",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          //  validator:(val)=> val.isEmpty? "enter displayname":null ,
                            onChanged: (val){
                              setState(()=>dname=val);
                            },
                          
                          ),
                        ),
                       
                        Container(
                          padding: EdgeInsets.all(10),
                          
                          child: TextFormField(
                            validator: (val)=>val.isEmpty ? 'Enter Email':null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email*",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                        //    validator:(val)=> val.isEmpty? "enter Email":null ,
                            onChanged: (val){
                              setState(()=>email=val);
                            },
                          
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                             validator: (val)=>val.length<6 ? 'Enter a Password of Atleast 6 Chars':null,
                        //    validator:(val)=> val.length<6?"password must be atleast 6 char":null ,
                            obscureText: true,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),
                              labelText: "Password",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            onChanged: (val){
                              setState(()=>password=val);
                            },
                          ),
                        )
                      ],
                    ),
                    ),
                  ),
                  Container(
                          padding: EdgeInsets.all(10),
                        child: TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Confirm Password"),
                        style: TextStyle(fontSize: 15),
                        obscureText: true,
                        validator: ( val) {
                          if (password != val) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),

                  ),       
                 
                   SizedBox(height: 20,),
                     Container(
                   
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child:RaisedButton(
                       padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10),
                    ),
                      color: Colors.red,
                    child: Center(
                      child: Text("REGISTER", style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: ()async{
                       if(_formKey.currentState.validate()){
                        dynamic result= await _auth.registerWithEmailAndPassword(email, password);
                        if (result== null){
                          setState(() =>error='Please Supply a Valid Email'
                            
                          );
                        }else{
                            setState(() {
                             Navigator.push(context, 
                             MaterialPageRoute(builder: (context)=>Login())
                           );
                        });
                         }
                       }
                    },
                    ),
                  
                   ),
                 SizedBox(height: 20,),
                 Center(
                    child:GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>Login())
                        );
                      },
                    child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Jost',
                            fontSize: 17.0,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    
                    ),
                    SizedBox(height: 12.0,),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red,fontSize: 14.0),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}