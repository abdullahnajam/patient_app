import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/Navigator/BottomNav.dart';
import 'package:toast/toast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:patient_app/Auth/LoginScreen.dart';
import 'package:patient_app/screens/OtpScreen.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';



class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

enum gender { male, female }

class _RegisterScreenState extends State<RegisterScreen> {

  gender _gender = gender.male;

  Color _backgroundColor = COLOR_WHITE;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  //TextEditingController fullName = TextEditingController();
  var number;

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: userName,
                  style: TextStyle(color: COLOR_GREY,  fontSize: 14),
                  cursorColor: COLOR_GREY,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: COLOR_GREY, fontSize: 14),
                      hintText: "Full Name",
                      fillColor: Colors.white70,
                      labelStyle: TextStyle(color: COLOR_GREY)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Full Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: email,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: password,
                  obscureText: _obscureText,
                  style: TextStyle(color: COLOR_GREY, fontSize: 14),
                  cursorColor: COLOR_GREY,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: COLOR_GREY,  fontSize: 14),
                    hintText: "Password",
                    fillColor: Colors.white70,
                    suffixIcon: IconButton(
                        icon: Icon(_iconVisible, color: COLOR_GREY, size: 20),
                        onPressed: () {
                          _toggleObscureText();
                        }),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8,7,8,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gender',
                        style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                      ),
                      Row(
                        children: [
                          new Radio(
                            value: gender.male,
                            groupValue: _gender,
                            onChanged: (gender? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          new Text(
                            'Male',
                            style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                          ),
                          new Radio(
                            value: gender.female,
                            groupValue: _gender,
                            activeColor: blue,
                            onChanged: (gender? value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          new Text(
                            'Female',
                            style: new TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 14,
                ),
                InternationalPhoneNumberInput(
                  textStyle: TextStyle(color: COLOR_GREY,  fontSize: 14),

                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    setState(() {
                      this.number = number.phoneNumber ;
                    });
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
                    print("Phone number is ${this.number}");
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

                      /*if(_formKey.currentState!.validate())
                      {
                        //print("number is :  $number");

                      }*/

                      signUp();

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
                          //Fluttertoast.showToast(msg: 'Signin with facebook', toastLength: Toast.LENGTH_SHORT);
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
                          //Fluttertoast.showToast(msg: 'Signin with google', toastLength: Toast.LENGTH_SHORT);
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
          ),
        )
    );
  }







/*
  Future<void> signUp()async {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ),
    );
    try {
      pr.show();
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      ).then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
         await userDetails.doc(user!.uid).set({
          "email": user.email.toString(),
          "fullName": fullName.text.trim(),
          "phoneNo": number,
          "type": 'patient',
          "gender" : _gender == gender.male ? "male" : "female",
        }).onError((error, stackTrace) {
          Toast.show(error.toString(), context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
        });
      }).then( (value) => pr.hide().then((value)async => await Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))));

    } on FirebaseAuthException catch (e) {
      setState(() {
        pr.hide();
      });
      print(e.code);
      print('hello');
      if (e.code == 'weak-password') {
        Toast.show("Weak Password", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      } else if (e.code == 'email-already-in-use') {

        Toast.show("Email Already Exist", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }
      else if (e.code == 'network-request-failed') {
        Toast.show("No Network", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }
      else{
        Toast.show("${e.code}", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }

    } catch (e) {
      pr.hide();
      print(e);
    }


  }
*/







  Future<void> signUp()async{
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ),
    );
    pr.show();
    print("1");
      final username = userName.text.trim();
      final emailT = email.text.trim();
      final passwordT = password.text.trim();
    print("2");

    final user =   ParseUser.createUser( emailT,passwordT);
    print("3");
    var response = await user.signUp(allowWithoutEmail: true);
    print("4");

    if (response.success) {
      savingUserData(user.objectId);
      pr.hide();

    } else {
      pr.hide();

      Toast.show("${response.error!.message}", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
    }
  }



  Future<void> savingUserData(String? objectId) async {
    var parseObject = ParseObject("userData")
      ..set("email", email.text.trim())
      ..set("fullName", userName.text.trim())
      ..set("phoneNo", number)
      ..set("type", 'patient')
      ..set('userObjectId', objectId)
      ..set("gender" , _gender == gender.male ? "male" : "female");

    final ParseResponse parseResponse = await parseObject.save();

    if (parseResponse.success) {
      var objectIds = (parseResponse.results!.first as ParseObject).objectId!;
      UserModel model = UserModel(objectIds,userName.text.trim().toString(),email.text.trim().toString(),number.toString(), _gender == gender.male ? "male" : "female",'patient',objectId!);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(model)));

     // Toast.show("Registered", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    } else {
      Toast.show('Object created with failed: ${parseResponse.error.toString()}', context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    }
  }



}