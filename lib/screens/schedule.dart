import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_app/screens/sideMenu.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'MainScreen.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  String dropdownValue='(UTC + 9:30) Beruit';
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                  ),
                  height: height*0.35,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                        },
                        child: Container(
                            margin: EdgeInsets.all(margin),
                            child:Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)
                        ),
                      ),
                      Text("Set your appointment availability",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
                        child: Text("Set your time zone",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),

                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(margin,0,margin,0),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style:  TextStyle(color: Colors.grey),
                          underline: Container(

                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['(UTC + 9:30) Beruit']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
                        child: Text("Schedule",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),),

                      ),
                      SizedBox(height: 10,),
                      DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: blue,

                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                        },
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.all(margin),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text("From",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    //margin: EdgeInsets.only(left: 10,right: 10),

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("6:30 PM",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text("to",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20),),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    //margin: EdgeInsets.only(left: 10,right: 10),

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("6:30 PM",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text("From",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    //margin: EdgeInsets.only(left: 10,right: 10),

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("6:30 PM",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text("to",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20),),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    //margin: EdgeInsets.only(left: 10,right: 10),

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("6:30 PM",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("+ Add more slots",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),),

                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(width*0.15, 10, width*0.15, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                        ),
                        alignment: Alignment.center,
                        child: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                      ),
                      Container(
                          height: height*0.2,
                          margin: EdgeInsets.all(margin),
                          padding: EdgeInsets.all(margin),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blue
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Message for doctor",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("It is a long established  fact that a reader will be distracted but also the leap into electronic typesetting"
                                ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                            ],
                          )
                      )
                    ],
                  )
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
