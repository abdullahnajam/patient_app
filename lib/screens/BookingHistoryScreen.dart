import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/screens/ReviewDoctorScreen.dart';

import 'MainScreen.dart';

class BookingHisttory extends StatefulWidget {
  const BookingHisttory({Key? key}) : super(key: key);

  @override
  _BookingHisttoryState createState() => _BookingHisttoryState();
}

class _BookingHisttoryState extends State<BookingHisttory> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(margin),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                      },
                      child:  CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                      ),
                    ),
                    Text("Appointment",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.notifications,size: 30,color: blue,),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      child:Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(margin),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffDCDCDC))
                            ),
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: blue,
                              indicator : BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: blue,
                              ),
                              /*indicator:  UnderlineTabIndicator(
                          borderSide: BorderSide(width: 0.0,color: Colors.white),
                          insets: EdgeInsets.symmetric(horizontal:16.0)
                      ),*/

                              tabs: [
                                Tab(text: 'Upcoming'),
                                Tab(text: 'Completed'),
                              ],
                            ),

                          ),

                          Container(
                            //height of TabBarView
                            height: MediaQuery.of(context).size.height*0.7,

                            child: TabBarView(children: <Widget>[
                              Container(
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context,int index){
                                    return Container(

                                      margin: EdgeInsets.fromLTRB(0,10,0,0),
                                      //height: height*0.2,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          border: Border.all(color: primary,width: 0.8)
                                      ),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10,right: 20),
                                            height: MediaQuery.of(context).size.height*0.08,
                                            width: MediaQuery.of(context).size.height*0.08,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(360),
                                                image: DecorationImage(
                                                    image: AssetImage(placeHolderLandScape),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("John Smith",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                                                    Container(
                                                      padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                                      margin: EdgeInsets.only(right: 10),
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors.yellow[600],
                                                        borderRadius: BorderRadius.circular(30)
                                                      ),
                                                      child:Text("Upcoming", style: TextStyle(color: Colors.white,fontSize: 12),),
                                                    )

                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Text("Female",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                SizedBox(height: 10,),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Date",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                    Text("20 Feb, 2021",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Duration",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                    Text("6:30 PM - 7:00 PM",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Booking ID",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                    Text("00001",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Total Payment",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                        SizedBox(width: 2,),
                                                        Text("\$200",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w300,fontSize: 10),),

                                                      ],
                                                    ),
                                                    Text("Paid",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    );
                                  },
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context,int index){
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ReviewDoctor()));
                                      },
                                      child: Container(

                                        margin: EdgeInsets.fromLTRB(0,10,0,0),
                                        //height: height*0.2,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(color: primary,width: 0.8)
                                        ),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10,right: 20),
                                              height: MediaQuery.of(context).size.height*0.08,
                                              width: MediaQuery.of(context).size.height*0.08,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(360),
                                                  image: DecorationImage(
                                                      image: AssetImage(placeHolderLandScape),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("John Smith",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                                                      Container(
                                                        padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                                        margin: EdgeInsets.only(right: 10),
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius: BorderRadius.circular(30)
                                                        ),
                                                        child:Text("Completed", style: TextStyle(color: Colors.white,fontSize: 12),),
                                                      )

                                                    ],
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text("Female",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                  SizedBox(height: 10,),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Date",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                      Text("20 Feb, 2021",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Duration",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                      Text("6:30 PM - 7:00 PM",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Booking ID",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                      Text("00001",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("Total Payment",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300,fontSize: 10),),
                                                          SizedBox(width: 2,),
                                                          Text("\$200",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w300,fontSize: 10),),

                                                        ],
                                                      ),
                                                      Text("Paid",style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w300,fontSize: 10),),

                                                    ],
                                                  )

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      )
                                    );
                                  },
                                ),
                              ),

                            ]),
                          )

                        ],

                      )
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
