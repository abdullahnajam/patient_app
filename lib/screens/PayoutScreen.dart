import 'package:doctor_app/screens/Accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor_app/utils/constants.dart';

import 'MainScreen.dart';



class PayoutScreen extends StatefulWidget {
  @override
  _PayoutScreenState createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
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
                  Text("Payout",
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
                height: 55,
              ),
              Container(
                child: Image.asset('assets/images/payout.png', height: 200),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Text('Get paid directly to your account!', style: TextStyle(
                    fontSize: 20, color: COLOR_BLACK, fontWeight: FontWeight.bold
                )),
              ),
              Center(
                child: Text('Add your account, and get your payout transferred.', style: TextStyle(
                    fontSize: 14, color: COLOR_GREY.withOpacity(0.5)
                )),
              ),
              SizedBox(
                height: 22,
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookingHisttory()));
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AccountScreen()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}