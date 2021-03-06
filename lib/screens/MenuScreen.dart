import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/screens/ChangePassword.dart';
import 'package:patient_app/Auth/LoginScreen.dart';
import 'package:patient_app/Navigator/BottomNav.dart';
import 'package:patient_app/screens/NotificationScreen.dart';
import 'package:patient_app/screens/PrivacyScreen.dart';
import 'package:patient_app/screens/ReportScreen.dart';
import 'package:patient_app/screens/SupportScreen.dart';
import 'package:patient_app/screens/TermsScreen.dart';
import 'package:patient_app/screens/WalletScreen.dart';
import 'package:patient_app/screens/favorite.dart';
import 'package:patient_app/screens/DoctorProfile.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:toast/toast.dart';

import 'editProfile.dart';

class MenuScreen extends StatefulWidget {
  UserModel model;


  MenuScreen(this.model);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}



//Radio Class
class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              }),
          RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                color: COLOR_BLACK,
                fontSize: 16
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}


//Main Screen

class _MenuScreenState extends State<MenuScreen> {
  bool _isRadioSelected = true;


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
          value:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          child: ListView(
            padding: EdgeInsets.fromLTRB(12, 52, 22, 12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(widget.model)));

                    },
                    child: Icon(Icons.arrow_back_ios_rounded,
                        color: COLOR_DARK_BLUE),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.white70, // <-- Button color
                    ),
                  ),
                  Text("Menu",
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
                height: 32,
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton.icon(
                                  icon: Icon(Icons.person,
                                      color: COLOR_DARK_BLUE),
                                  label: Text(
                                    'Profile',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: COLOR_BLACK,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: (){
                                  } ,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  color: COLOR_DARK_BLUE,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditProfile(widget.model)));

                              },
                              child: const Text('Profile '),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChangePasswordScreen(widget.model)));
                              },
                              child: const Text('Change Password'),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 15
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextButton.icon(
                                  icon: Icon(Icons.account_balance_wallet,
                                      color: COLOR_DARK_BLUE),
                                  label: Text(
                                    'Wallet',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: COLOR_BLACK,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WalletScreen()));

                                  },
                                ),
                              ],
                            ),
                      ),

                    ],
                  ),
                ),
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton.icon(
                                  icon: Icon(Icons.language,
                                      color: COLOR_DARK_BLUE),
                                  label: Text(
                                    'Language',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: COLOR_BLACK,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: null,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: COLOR_DARK_BLUE,
                                  size: 20.0,
                                ),
                              ],
                            ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LinkedLabelRadio(
                              label: 'English',
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              value: true,
                              groupValue: _isRadioSelected,
                              onChanged: (bool newValue) {
                                setState(() {
                                  _isRadioSelected = newValue;
                                  context.locale = Locale('en', 'US');

                                });
                              },
                            ),
                            LinkedLabelRadio(
                              label: 'Arabic',
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              value: false,
                              groupValue: _isRadioSelected,
                              onChanged: (bool newValue) {
                                setState(() {
                                  _isRadioSelected = newValue;
                                  context.locale = Locale('ar', 'EG');

                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 15
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.notifications,
                                  color: COLOR_DARK_BLUE),
                              label: Text(
                                'Notifications',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotificationScreen()));

                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 15
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.favorite,
                                  color: COLOR_DARK_BLUE),
                              label: Text(
                                'Favorites',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Favorite()));
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 15
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.logout,
                                  color: COLOR_DARK_BLUE),
                              label: Text(
                                'Log Out',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: ()async{
                                final user = await ParseUser.currentUser() as ParseUser;
                                var response = await user.logout();

                                if (response.success) {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

                                } else {
                                  Toast.show("${response.error!.message}", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
                                }

                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Center(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const ListTile(
                      //   leading: Icon(Icons.album),
                      //   title: Text('The Enchanted Nightingale'),
                      //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton.icon(
                                  icon: Icon(Icons.support_agent,
                                      color: COLOR_DARK_BLUE),
                                  label: Text(
                                    'Help & Support',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: COLOR_BLACK,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: null,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: COLOR_DARK_BLUE,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SupportScreen()));

                              },
                              child: const Text('Support'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TermsScreen()));

                              },
                              child: const Text('Terms & Conditions'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PrivacyScreen()));

                              },
                              child: const Text('Privacy Policy'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(

                                primary: COLOR_BLACK,
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: COLOR_BLACK,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ReportScreen()));

                              },
                              child: const Text('Reports and Flag'),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
