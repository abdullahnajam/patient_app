import 'package:doctor_app/screens/ChangePassword.dart';
import 'package:doctor_app/screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:doctor_app/utils/constants.dart';
import 'BookAppointmentScreen.dart';
import 'ChatScreen.dart';
import 'MainScreen.dart';

class Setting extends StatefulWidget {

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var margin = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primary,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            height: MediaQuery.of(context).size.height,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.125),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.125,
              child: ListView(children: [
                Container(
                  height: width * 0.4,
                  margin:
                  EdgeInsets.only(left: width * 0.3, right: width * 0.3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage("assets/placeholder/doctor.png"),
                          fit: BoxFit.cover)),
                ),
              ]
              )
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.380),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height * 0.125,
            child:  Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Liza Will",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    Text(
                      "Personal Info",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookingHisttory()));
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorProfile()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border :Border.all(color: COLOR_DARK_PURPLE)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left:15, right:15, top:4, bottom: 4 ),
                          child: Text("Edit Profile",style: TextStyle(color: COLOR_LIGHT_PURPLE,fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset('assets/images/notification_icon.png', height: 70),
                            ),
                            Expanded(
                                flex: 6,
                                child: Text("Notification", style:
                                TextStyle(
                                    color: COLOR_GREY.withOpacity(0.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),)
                            ),
                            Expanded(
                                flex: 2,
                                child: Switch(
                                  value: true,
                                  onChanged: (bool newValue){
                                    setState(() {

                                    });
                                  },
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset('assets/images/notification_sound.png', height: 70),
                            ),
                            Expanded(
                                flex: 6,
                                child: Text("Notification Sound", style:
                                TextStyle(
                                    color: COLOR_GREY.withOpacity(0.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),)
                            ),
                            Expanded(
                                flex: 2,
                                child: Switch(
                                  value: false,
                                  onChanged: (bool newValue){
                                    setState(() {

                                    });
                                  },
                                )
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChangePasswordScreen()));
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(margin),
                        decoration: BoxDecoration(
                          gradient: colorGradient,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
          )
        ],
      ),
    );
  }
}
