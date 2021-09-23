import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor_app/utils/constants.dart';

import 'MainScreen.dart';



class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Color _backgroundColor = COLOR_WHITE;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(10, 42, 12, 14),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    child: Icon(Icons.arrow_back_ios_rounded,
                        color: COLOR_DARK_BLUE),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.white70, // <-- Button color
                    ),
                  ),
                  Text("Accounts",
                      style: TextStyle(
                        fontSize: 20,
                        color: COLOR_BLACK,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 55,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/stripe.png', height: 30, width: 100,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Stripe",style: TextStyle(fontSize: 16,color: Colors.grey),),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [COLOR_LIGHT_BLUE,COLOR_LIGHT_PURPLE],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left:15, right:15, top:4, bottom: 4 ),
                                child: Text("Connect",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/paypal.png', height: 50, width: 100,),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Paypal",style: TextStyle(fontSize: 16,color: Colors.grey),),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [COLOR_LIGHT_BLUE,COLOR_LIGHT_PURPLE],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left:15, right:15, top:4, bottom: 4 ),
                                child: Text("Connect",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }
}