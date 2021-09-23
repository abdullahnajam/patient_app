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
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.070),
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height * 0.105,
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
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                  image: AssetImage("assets/placeholder/doctor.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ]
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(margin),
                      child:Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    width: width*0.9,
                    margin: EdgeInsets.only(top: height*0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Text("Dr. Ayman!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                              ),
                              child:Text("Health Care",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),

                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                              ),
                              child:Text("Medicine",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),

                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                              ),
                              child:Text("Covid 19",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),

                            ),
                            
                          ],
                        ),
                        SizedBox(height: 10,),
                        RatingBar(
                          initialRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star,color: COLOR_YELLOW),
                            half: Icon(Icons.star_half,color: COLOR_YELLOW),
                            empty:Icon(Icons.star_border,color: COLOR_YELLOW,),
                          ),
                          itemSize: 20,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                children: [
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Color(0xffA5A5E2),
                    child: Icon(Icons.phone,color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Text("+090078601",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16),),
                  SizedBox(width: 10,),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(margin,10,margin,0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                children: [
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Color(0xffFF5C87),
                    child: Icon(Icons.email,color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Text("Dr.Ayman@gmail.com",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16),),
                  SizedBox(width: 10,),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(margin,10,margin,0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                children: [
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Color(0xffBB68AD),
                    child: Icon(Icons.timer,color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Text("6:30PM-7:00 PM  jan 21 , 2021",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16),),
                  SizedBox(width: 10,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
              child: Text("Schedule",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 22),),

            ),
            Container(
              margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: blue,
                      child: Text("M",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: blue,
                      child: Text("T",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: blue,
                      child: Text("W",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: blue,
                      child: Text("T",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: blue,
                      child: Text("F",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                    ),
                  ),
                ],
              )

            ),
            Container(
              margin: EdgeInsets.all(margin),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffA5A5E2),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Mon",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
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
                      Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffA5A5E2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Mon",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
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
                      Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffA5A5E2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Mon",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
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
                      Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffA5A5E2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Mon",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
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
                      Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffA5A5E2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Mon",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w300,fontSize: 16),),
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
                      Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
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
        ),
      ),
    );
  }
}
