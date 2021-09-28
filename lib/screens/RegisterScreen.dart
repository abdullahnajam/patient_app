import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patient_app/screens/LoginScreen.dart';
import 'package:patient_app/screens/OtpScreen.dart';
import 'package:patient_app/utils/constants.dart';



class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
              Container(
                child: Image.asset('assets/images/login_bg.png', height: 180),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text('Welcome Back!', style: TextStyle(
                    fontSize: 26, color: COLOR_BLACK, fontWeight: FontWeight.bold
                )),
              ),
              Center(
                child: Text('Register Your Account', style: TextStyle(
                    fontSize: 14, color: COLOR_GREY.withOpacity(0.5)
                )),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                style: TextStyle(color: COLOR_GREY,  fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: COLOR_GREY, fontSize: 14),
                    hintText: "First Name",
                    fillColor: Colors.white70,
                    labelStyle: TextStyle(color: COLOR_GREY)),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                style: TextStyle(color: COLOR_GREY,  fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: COLOR_GREY, fontSize: 14),
                    hintText: "Last Name",
                    fillColor: Colors.white70,
                    labelStyle: TextStyle(color: COLOR_GREY)),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                style: TextStyle(color: COLOR_GREY,  fontSize: 14),
                cursorColor: COLOR_GREY,
                decoration: InputDecoration(
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
                height: 16,
              ),
              InternationalPhoneNumberInput(
                textStyle: TextStyle(color: COLOR_GREY,  fontSize: 14),

                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                formatInput: false,
                keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OTPScreen()));
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
                        "Register",
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
                height: 16,
              ),
              Center(
                child: Text('Or sign up with', style: TextStyle(
                    fontSize: 12, color: COLOR_GREY.withOpacity(0.5)
                )),
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
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Signin with facebook', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: COLOR_LIGHT_BLUE,
                          borderRadius: BorderRadius.all(
                              Radius.circular(4)
                          ),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 74,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Signin with google', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:COLOR_RED,
                          borderRadius: BorderRadius.all(
                              Radius.circular(4)
                          ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
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