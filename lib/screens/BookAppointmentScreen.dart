import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/utils/constants.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            height: MediaQuery.of(context).size.height*0.3,
            padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.08,
              left: MediaQuery.of(context).size.width*0.05,
              right: MediaQuery.of(context).size.width*0.05,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Text("Book An Appointment",style: TextStyle(color: Colors.white,fontSize: 18),),
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
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                  child: Text("Select Appointment Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: primary,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      //_selectedValue = date;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                  child: Divider(color: Colors.grey,)
                ),
                Container(
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                  child: Text("Select Appointment Time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                          Container(
                            width: width*0.3,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white,width: 2),

                            ),
                            child: Text("05:00 PM", style: TextStyle(color: COLOR_BLACK)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
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
                      Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                ),


              ],
            )
          )
        ],
      ),
    );
  }
}
