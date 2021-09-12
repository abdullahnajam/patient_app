import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctor_app/screens/LoginScreen.dart';
import 'package:doctor_app/utils/constants.dart';

import 'ForgotPasswordSentScreen.dart';



class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  Color _backgroundColor = COLOR_WHITE;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

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
            padding: EdgeInsets.fromLTRB(22, 52, 22, 24),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Icon(Icons.arrow_back_ios_rounded,
                        color: COLOR_DARK_BLUE),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.white70, // <-- Button color
                    ),
                  ),
                  Text("Reset Your Password",
                      style: TextStyle(
                        fontSize: 18,
                        color: COLOR_BLACK,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 45,
                  ),
                ],
              ),
              SizedBox(
                height: 52,
              ),
              Container(
                child: Image.asset('assets/images/reset_password.png', height: 180),
              ),
              SizedBox(
                height: 46,
              ),
              Text('Please enter new password', style: TextStyle(
                    fontSize: 14, color: COLOR_GREY
                )
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                obscureText: _obscureText,
                style: TextStyle(color: COLOR_GREY, fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: COLOR_GREY,  fontSize: 14),
                  hintText: "New Password",
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: COLOR_GREY, size: 20),
                      onPressed: () {
                        _toggleObscureText();
                      }),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                obscureText: _obscureText,
                style: TextStyle(color: COLOR_GREY, fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: COLOR_GREY,  fontSize: 14),
                  hintText: "Re-entered Password",
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: COLOR_GREY, size: 20),
                      onPressed: () {
                        _toggleObscureText();
                      }),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {

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
                        "Save",
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
            ],
          ),
        )
    );
  }
}