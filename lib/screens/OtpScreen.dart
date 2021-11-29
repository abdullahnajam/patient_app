import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/utils/constants.dart';

import '../Navigator/BottomNav.dart';



class OTPScreen extends StatefulWidget {
  UserModel model;

  OTPScreen(this.model);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
              Container(
                child: Image.asset('assets/images/otp.png', height: 180),
              ),
              Center(
                child: Text('Verify OTP', style: TextStyle(
                    fontSize: 26, color: COLOR_BLACK, fontWeight: FontWeight.bold
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'We will auto-detect the OTP sent to\n\t\t\t your mobile',
                    style: TextStyle(fontSize: 15, color: COLOR_GREY.withOpacity(0.5)
                    ), /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                          text: ' +91-111111111',
                          style: TextStyle(fontSize: 15, color: COLOR_DARK_BLUE)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width-20,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 55,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 18, color: COLOR_BLACK),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(widget.model)));
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
                        "Verify OTP",
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
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn\'t received a OTP??',
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