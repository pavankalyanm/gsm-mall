import 'package:flutter/material.dart';
import 'package:gsm_mall/authenticate/authservice.dart';
import 'package:gsm_mall/pages/home/home_main.dart';
import 'package:gsm_mall/pages/login_signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsm_mall/pages/login_signup/forgot_password.dart';

import 'package:gsm_mall/widgets/loading.dart';
import 'package:gsm_mall/wrapper.dart';


class Login extends StatefulWidget {
  
  final Function widview;
  Login({this.widview});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final Authservice _auth = Authservice();
   final _formkey=GlobalKey<FormState>();

   bool loading=false;
    String error="";
    String email="";
    String password="";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
       body: SingleChildScrollView(
      //  key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           SizedBox(height: 170,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Center(child: Text("LOGIN", style: TextStyle( fontSize: 30,fontFamily: 'Jost'),)),
                  SizedBox(height: 30,),
                  Container(
                   
                    child: Form(
                      key: _formkey,
                 //   key: _formKey,
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
                            
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email*",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          validator:(val)=> val.isEmpty? "enter username":null ,
                            onChanged: (val){
                              setState(()=>email=val);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                             validator:(val)=> val.length<6?"password must be atleast 6 char":null ,
                           // validator:(val)=> val.length<6?"password must be atleast 6 char":null ,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(),labelText: "Password*" ,
                              
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
                  SizedBox(height: 20,),
                  
                  Center(
                    child: InkWell(
                            onTap: () {
                              Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>ForgotPasswordPage())
                        );
                            },
                            child: Text(
                              'FORGOT PASSWORD?',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Jost',
                                fontSize: 16.0,
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.bold,
                              ),
                            )
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
                      child: Text("LOGIN", style: TextStyle(color: Colors.white,fontFamily: 'Jost'),),
                    ),
                   onPressed: ()async{
                     if (_formkey.currentState.validate()) {
                        setState(()=>loading=true );
                          
                        
                         dynamic result= await _auth.signInWithEmailAndPassword(email, password);
                         if (result==null){
                           setState((){

                           error ="Invalid Email or Password " ;
                            loading=false;

                            }
                           );
                         }else{
                           setState(() {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMain()));
                           });
                         }       
                    }
                       

                   },
                    )
                   ),
                 SizedBox(height: 20,),
                 Center(
                    child:GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>Signup())
                        );
                      },
                    child: Text(
                          'CREATE ACCOUNT',
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
