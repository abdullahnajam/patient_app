import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor_app/utils/constants.dart';

import 'ForgotPasswordScreen.dart';
import 'MainScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                    Center(
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                Center(
                    child: Text(
                  "Sign in to continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                )),
              ],
            )),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: COLOR_GREY, fontSize: 14),
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
                height: 24,
              ),
              TextField(
                obscureText: _obscureText,
                style: TextStyle(color: COLOR_GREY, fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: COLOR_GREY, fontSize: 14),
                  hintText: "Password",
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: COLOR_GREY, size: 20),
                      onPressed: () {
                        _toggleObscureText();
                      }),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ForgotPasswordScreen()));
                },
                child: Text('Forgot Password?',
                    style: TextStyle(color: COLOR_GREY, fontSize: 13),
                    textAlign: TextAlign.start),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()));
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
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text('Or Connect Using',
                    style: TextStyle(
                        fontSize: 12, color: COLOR_GREY.withOpacity(0.5))),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: 'Signin with facebook',
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: COLOR_LIGHT_BLUE,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 74,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: 'Signin with google',
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: COLOR_RED,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/google.png'),
                          width: 74,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RegisterScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 15, color: COLOR_GREY.withOpacity(0.5)),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(
                                fontSize: 15, color: COLOR_DARK_BLUE)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
