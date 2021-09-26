import 'package:doctor_app/screens/BookingHistoryScreen.dart';
import 'package:doctor_app/screens/MenuScreen.dart';
import 'package:doctor_app/screens/NotificationScreen.dart';
import 'package:doctor_app/screens/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/screens/ProfileScreen.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  String dropdownValue='Monthly';
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    bool status;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.04;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(margin),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MenuScreen()));
                    },
                    child:  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.menu,color:blue,),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [COLOR_LIGHT_BLUE,COLOR_LIGHT_PURPLE],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left:5, right:5, top:2, bottom: 2 ),
                      child: Text("Contact support to get your profile approved",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 9),),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotificationScreen()));
                    },
                    icon: Icon(Icons.notifications,size: 30,color: blue,),
                  )
                ],
              ),
            ),
            Text("Hi, Ayman!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color: Colors.black),),
            Text("Good Morning",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.black),),
            SizedBox(
              height: 22,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         Text("Status : ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
            //         Text("Online",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.green),),
            //
            //       ],
            //     ),
            //     Switch(
            //         value: true,
            //       onChanged: (bool newValue){
            //           setState(() {
            //
            //           });
            //       },
            //     )
            //   ],
            // ),
            Container(
              height: MediaQuery.of(context).size.height*0.16,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children:  <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(placeHolderLandScape),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(placeHolderLandScape),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(placeHolderLandScape),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.black),
                  underline: Container(

                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Monthly', 'Yearly']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    //margin: EdgeInsets.all(margin),
                    height: height*0.32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: margin,right: margin,top: 10),
                          child: Container()
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(margin,margin,margin,0),
                              height:120,
                              width: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("assets/placeholder/doctor.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: margin,),
                                  Text("11",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
                                  Text("Total Consultation",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14,),),
                                  SizedBox(height: 5,),
                                  Text("20",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
                                  Text("Total Consult Hours",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
                                  SizedBox(height: 5,),
                                  Text("Earnings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                  Text("\$220",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),

                                ],
                              ),]),
                            )
                          ],
                        ),
                      ],
                    )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: width*0.7,
                    margin: EdgeInsets.only(top: height*0.28),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Column(

                      children: [
                        Row(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("5.0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            SizedBox(width: 5,),
                            Text("Patient Average Rating",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 13),),
                            SizedBox(width: 5,),
                          ],
                        ),
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

                      ],
                    ),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Incoming Appointments",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookingHisttory()));
                    },
                      child: Text("See All",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: blue),)),

                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Schedule()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: height*0.16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff5f4fa),
                    border: Border.all(color: Colors.grey,width: 0.8)
                ),
                child: Container(
                  margin: EdgeInsets.only(top: height*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.height*0.09,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                image: DecorationImage(
                                    image: AssetImage(placeHolderLandScape),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                              SizedBox(height: 3,),
                              Text("Female",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),

                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.place,color: primary,size: 20,),
                                      SizedBox(width: 2,),
                                      Text("Miami, USA",style: TextStyle(color: blue,fontWeight: FontWeight.w500,fontSize: 12),),

                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(

                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 15,),
                                      SizedBox(width: 3,),
                                      Text("20 Feb, 2020",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.timer,color: Colors.grey,size: 15,),
                                      SizedBox(width: 3,),
                                      Text("8:00 - 9:00 AM",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),
                                    ],
                                  ),
                                ],
                              )



                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                          ),
                          child: Icon(Icons.chat,color: Colors.white,),
                        )

                      )
                    ],
                  ),
                ),

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Schedule()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: height*0.16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff5f4fa),
                    border: Border.all(color: Colors.grey,width: 0.8)
                ),
                child: Container(
                  margin: EdgeInsets.only(top: height*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            height: MediaQuery.of(context).size.height*0.09,
                            width: MediaQuery.of(context).size.height*0.09,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                image: DecorationImage(
                                    image: AssetImage(placeHolderLandScape),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                              SizedBox(height: 3,),
                              Text("Female",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),

                              SizedBox(height: 5,),

                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.place,color: primary,size: 20,),
                                        SizedBox(width: 2,),
                                        Text("Miami, USA",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 12),),

                                      ],
                                    ),
                                  ),

                              SizedBox(height: 5,),
                              Row(

                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 15,),
                                      SizedBox(width: 3,),
                                      Text("20 Feb, 2020",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),
                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.timer,color: Colors.grey,size: 15,),
                                      SizedBox(width: 3,),
                                      Text("8:00 - 9:00 AM",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),
                                    ],
                                  ),
                                ],
                              )



                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                            ),
                            child: Icon(Icons.chat,color: Colors.white,),
                          )

                      )
                    ],
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
