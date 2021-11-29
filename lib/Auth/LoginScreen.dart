import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import '../screens/ForgotPasswordScreen.dart';
import '../Navigator/BottomNav.dart';
import 'RegisterScreen.dart';



class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  Color _backgroundColor = COLOR_WHITE;

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  child: Text('Sign in to continue', style: TextStyle(
                      fontSize: 14, color: COLOR_GREY.withOpacity(0.5)
                  )),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: email,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24,
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
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPasswordScreen(widget.model)));
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          color: COLOR_GREY,
                          fontSize: 13
                      ),
                      textAlign: TextAlign.right
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate())
                        {
                          signIn();
                        }
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
                          "Login",
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
                  child: Text('Or Connect Using', style: TextStyle(
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
                          // Fluttertoast.showToast(msg: 'Signin with facebook', toastLength: Toast.LENGTH_SHORT);
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
                         // Fluttertoast.showToast(msg: 'Signin with google', toastLength: Toast.LENGTH_SHORT);
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
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(fontSize: 15, color: COLOR_GREY.withOpacity(0.5)
                        ), /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign Up',
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

  Future<void> signIn ()async
  {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ),
    );
    try {
      pr.show();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      ).then((value) {
        print("value is $value");
        User? user =  FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) async {
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          UserModel model= UserModel.fromMap(data, documentSnapshot.reference.id);
          pr.hide();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(model)));
        });


        return value;
      });

    } on FirebaseAuthException catch (e) {
      setState(() {
        pr.hide();
      });
      if (e.code == 'user-not-found') {
        Toast.show("User Not Registered", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      } else if (e.code == 'wrong-password') {
        Toast.show("Wrong Password", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }
      else if (e.code == 'network-request-failed') {
        Toast.show("No Network", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }
      else{
        Toast.show("${e.code}", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
      }
    }
  }


}
