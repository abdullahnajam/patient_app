import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/utils/constants.dart';

import 'MainScreen.dart';



class ForgotPasswordSentScreen extends StatefulWidget {
  @override
  _ForgotPasswordSentScreenState createState() => _ForgotPasswordSentScreenState();
}

class _ForgotPasswordSentScreenState extends State<ForgotPasswordSentScreen> {
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
            padding: EdgeInsets.fromLTRB(12, 52, 22, 12),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_rounded, color: COLOR_DARK_BLUE),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.white70, // <-- Button color
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Text('Email has been sent!', style: TextStyle(
                    fontSize: 26, color: COLOR_BLACK, fontWeight: FontWeight.bold
                )),
              ),
              Center(
                child: Text('\t\t Please check your inbox & click\nin the received link to reset password', style: TextStyle(
                    fontSize: 14, color: COLOR_GREY.withOpacity(0.5)
                )),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                child: Image.asset('assets/images/forgot_pass_done.png', height: 280),
              ),
              SizedBox(
                height: 66,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));

                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [COLOR_DARK_BLUE, COLOR_LIGHT_PURPLE],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                      constraints: BoxConstraints( minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Click Resend', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn\'t received a link??',
                      style: TextStyle(fontSize: 15, color: COLOR_GREY.withOpacity(0.5)
                      ), /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Resend',
                            style: TextStyle(fontSize: 15, color: COLOR_DARK_BLUE)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}