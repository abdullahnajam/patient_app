import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/DoctorModel.dart';
import 'package:patient_app/screens/home_page.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class BookAppointment extends StatefulWidget {
  DoctorModel model ;
  int sessionPrice , sessionHours ;


  BookAppointment(this.model, this.sessionPrice, this.sessionHours);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  int selectedIndex = -1;
  var _selectedData = DateTime
      .now()
      .millisecondsSinceEpoch;
  final List<String> items = <String>[
    "8:00 Am",
    "9:00 Am",
    "10:00 Am",
    "11:00 Am",
    "12:00 Pm",
    "1:00 Pm",
    "2:00 Pm",
    "3:00 Pm",
    "4:00 Pm",
    "5:00 Pm",
    "6:00 Pm",
    "7:00 Pm",
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var margin = MediaQuery
        .of(context)
        .size
        .width * 0.05;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            padding: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.08,
              left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.arrow_back_ios_rounded, color: Colors.grey,),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Text("Book An Appointment",
                        style: TextStyle(color: Colors.white, fontSize: 18),),
                    )
                )


              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
              ),
              margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.25),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(MediaQuery
                        .of(context)
                        .size
                        .width * 0.03),
                    child: Text("Select Appointment Date", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                  ),
                  DatePicker(
                    DateTime.now(),
                    daysCount: 90,
                    height: height * 0.13,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: primary,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedData = date.millisecondsSinceEpoch;
                      });
                    },
                  ),
                  Container(
                      margin: EdgeInsets.all(MediaQuery
                          .of(context)
                          .size
                          .width * 0.03),
                      child: Divider(color: Colors.grey,)
                  ),
                  Container(
                    margin: EdgeInsets.all(MediaQuery
                        .of(context)
                        .size
                        .width * 0.03),
                    child: Text("Select Appointment Time", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                  ),


                  Container(
                    height: height*0.24,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      thickness: 5,
                      radius: const Radius.circular(15), // give the thumb rounded corners
                      showTrackOnHover: true,

                    child: GridView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery
                              .of(context)
                              .size
                              .width /
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .height / 4.2),
                        ),
                        itemCount: items.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: width * 0.2,
                                height: height * 0.02,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index ? primary : Colors
                                      .white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: selectedIndex == index
                                      ? primary
                                      : Colors.white, width: 2),

                                ),
                                child: Text(items[index], style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : COLOR_BLACK)),
                              ),
                            ),
                          );
                        }),),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      savingUserData();
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
                          Text("Confirm", style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),),
                        ],
                      ),
                    ),
                  ),


                ],
              )
          )
        ],
      ),
    );
  }



  Future<void> savingUserData() async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;

    var parseObject = ParseObject("reservation")
    /*
    * 'userId': getUid(), // 42
       'date': _selectedData,
       'time': items[selectedIndex],
       'doctorId': widget.model.id,
       'doctorName': widget.model.name,
       'doctorProfile': widget.model.profile,
       'doctorSpeciality': widget.model.speciality,
       'sessionPrice':  widget.sessionPrice,
       'sessionHours': widget.sessionHours,
       'status': "pending",*/

      ..set("userId", currentUser.objectId.toString())
      ..set("date", _selectedData)
      ..set("time", items[selectedIndex])
      ..set("doctorId", widget.model.id)
      ..set('doctorName', widget.model.name)
      ..set('doctorProfile', widget.model.profile)
      ..set('doctorSpeciality', widget.model.speciality)
      ..set('sessionPrice', widget.sessionPrice)
      ..set('sessionHours', widget.sessionHours)
      ..set("status" , "pending");

    final ParseResponse parseResponse = await parseObject.save();

    if (parseResponse.success) {
      //var objectIds = (parseResponse.results!.first as ParseObject).objectId!;
      // Toast.show("Booked", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM , textColor: primary , backgroundColor: Colors.white);

      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Appointment Booked"),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Your Appointment has been successfully booked'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );


      // Toast.show("Registered", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    } else {
      Toast.show('Object created with failed: ${parseResponse.error.toString()}', context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    }
  }


/*
   Future<void> reserveBooking()async {
     reservationDetail.doc().set({
       'userId': getUid(), // 42
       'date': _selectedData,
       'time': items[selectedIndex],
       'doctorId': widget.model.id,
       'doctorName': widget.model.name,
       'doctorProfile': widget.model.profile,
       'doctorSpeciality': widget.model.speciality,
       'sessionPrice':  widget.sessionPrice,
       'sessionHours': widget.sessionHours,
       'status': "pending",
     }).then((value) {
       Toast.show("Booked", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM , textColor: primary , backgroundColor: Colors.white);
       Navigator.pop(context);
       Navigator.pop(context);
     }).catchError((error) => print("Failed to add user: $error"));
    }
*/




}