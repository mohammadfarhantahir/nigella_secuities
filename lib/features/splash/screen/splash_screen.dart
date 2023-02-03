


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget{
  State<splashScreen> createState()=> splashScreenState();
}

class splashScreenState extends State<splashScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFFFF),

      ),
      body: Center(
        child: Image.asset('assets/images/splash.png',
        ),
      ), //Image.asset
     // Image.asset,

    );
  }

}