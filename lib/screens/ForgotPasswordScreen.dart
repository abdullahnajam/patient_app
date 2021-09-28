import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/screens/LoginScreen.dart';
import 'package:patient_app/utils/constants.dart';

import 'ForgotPasswordSentScreen.dart';



class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

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
                height: 12,
              ),
              Center(
                child: Text('Forgot Your Password?', style: TextStyle(
                    fontSize: 26, color: COLOR_BLACK, fontWeight: FontWeight.bold
                )),
              ),
              Center(
                child: Text('\t\t Enter your registered email below\nto receive password reset instructions', style: TextStyle(
                    fontSize: 14, color: COLOR_GREY.withOpacity(0.5)
                )),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Image.asset('assets/images/forgot_pass.png', height: 280),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: COLOR_GREY,  fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: COLOR_GREY, fontSize: 14),
                    hintText: "Email",
                    fillColor: Colors.white70,
                    labelStyle: TextStyle(color: COLOR_GREY)),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordSentScreen()));

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
                        "Send",
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
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Remember Password?',
                      style: TextStyle(fontSize: 15, color: COLOR_GREY.withOpacity(0.5)
                      ), /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign In',
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