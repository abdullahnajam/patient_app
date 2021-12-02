import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/screens/MenuScreen.dart';
import 'package:patient_app/utils/constants.dart';




class ChangePasswordScreen extends StatefulWidget {
  UserModel model;

  ChangePasswordScreen(this.model);

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
            padding: EdgeInsets.fromLTRB(12, 52, 22, 12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MenuScreen(widget.model)));

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

              Center(
                child: Text("Password Reset Instruction Will be Sent to ${widget.model.email.toString()}", style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MenuScreen(widget.model)));

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
                        "Reset Password",
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

/*  void doUserResetPassword() async {
    final ParseUser user = ParseUser(null, null, widget.model.email);
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (parseResponse.success) {
      Message.showSuccess(
          context: context,
          message: 'Password reset instructions have been sent to email!',
          onPressed: () {
            Navigator.of(context).pop();
          });
    } else {
      Message.showError(context: context, message: parseResponse.error!.message);
    }
  }*/
}