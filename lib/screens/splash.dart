import 'dart:async';

import 'package:doctor_app/screens/HomeScreen.dart';
import 'package:doctor_app/screens/onBoardingScreen.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final splashDelay = 5;


/*  @override
  void initState() {
    super.initState();
    _loadWidget();
  }
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }*/

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",width: 250,height: 250,),
              SizedBox(height: 100,),
              InkWell(
                onTap: navigationPage,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                ),
              ),
            ],
          )),
          decoration: BoxDecoration(
            color: Colors.white
          )
      ),
    );
  }
}

