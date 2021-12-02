import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/screens/review_doctor.dart';

import '../Navigator/BottomNav.dart';
import 'constants.dart';

class BookingHisttory extends StatefulWidget {
  UserModel model;

  BookingHisttory(this.model);


  @override
  _BookingHisttoryState createState() => _BookingHisttoryState();
}

class _BookingHisttoryState extends State<BookingHisttory> {



  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(widget.model)));
                      },
                      child:  CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                      ),
                    ),
                    Text("Booking History",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.search_outlined,size: 30,color: Colors.grey[300],),
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
                            height: MediaQuery.of(context).size.height*0.57,

                            child: TabBarView(children: <Widget>[

                              Container(
                                child: FutureBuilder<List<ParseObject>>(
                                  future: getUpcoming(),
                                  builder: (BuildContext context, AsyncSnapshot<List<ParseObject>> snapshot){
                                    if (snapshot.hasError) {
                                      return  Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          const Center(child: Text('Something Went Wrong',style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600
                                          ),)),
                                        ],
                                      );
                                    }

                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          Center(child: CircularProgressIndicator(
                                            valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                          ),),
                                        ],
                                      );
                                    }

                                    if(snapshot.data!.isEmpty )
                                    {
                                      return Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          const Center(child: Text('No History',style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600
                                          ),)),
                                        ],
                                      );


                                    }


                                    return ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        padding: EdgeInsets.all(0),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (BuildContext context,int index){
                                          final data = snapshot.data![index];

                                          return Container(

                                            margin: EdgeInsets.only(top: 10),
                                            height: height*0.12,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                                border: Border.all(color: primary,width: 0.8)
                                            ),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 10,right: 10),
                                                  height: MediaQuery.of(context).size.height*0.07,
                                                  width: MediaQuery.of(context).size.height*0.07,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(360),

                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageBuilder: (context, imageProvider) => Container(
                                                      height: MediaQuery.of(context).size.height*0.07,
                                                      width: MediaQuery.of(context).size.height*0.07,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: imageProvider, fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    imageUrl: data.get('doctorProfile'),
                                                    placeholder: (context, url) => CircularProgressIndicator(
                                                      valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                                    ),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                                                          Text(data.get("doctorName"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                                                          Container(
                                                            padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                                            margin: EdgeInsets.only(right: 10),
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Colors.yellow[600],
                                                                borderRadius: BorderRadius.circular(30)
                                                            ),
                                                            child:Text("Pending", style: TextStyle(color: Colors.white,fontSize: 12),),
                                                          )

                                                        ],
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(data.get("doctorSpeciality"),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child:Row(
                                                              children: [
                                                                Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 15,),
                                                                Text(convertDateTimeDisplay(DateTime.fromMillisecondsSinceEpoch(data.get('date') ).toString()),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child:Row(
                                                              children: [
                                                                Icon(Icons.timer,color: Colors.grey,size: 15,),
                                                                Text(data.get('sessionHours').toString(),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child:Row(
                                                              children: [
                                                                Icon(Icons.monetization_on,color: Colors.grey,size: 15,),
                                                                Text("\$${data.get('sessionPrice').toString()}",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                          );

                                        }
                                    );
                                  },
                                ),

                              ),

                              Container(
                                child: FutureBuilder<List<ParseObject>>(
                                  future: getCompleted(),
                                  builder: (BuildContext context, AsyncSnapshot<List<ParseObject>> snapshot){
                                    if (snapshot.hasError) {
                                      return  Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          const Center(child: Text('Something Went Wrong',style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600
                                          ),)),
                                        ],
                                      );
                                    }

                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          Center(child: CircularProgressIndicator(
                                            valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                          ),),
                                        ],
                                      );
                                    }

                                    if(snapshot.data!.isEmpty )
                                    {
                                      return Column(
                                        children: [
                                          SizedBox(height : size.height*0.3),
                                          const Center(child: Text('No History',style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600
                                          ),)),
                                        ],
                                      );


                                    }


                                    return ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (BuildContext context,int index){
                                        final data = snapshot.data![index];

                                        return Container(

                                          margin: EdgeInsets.only(top: 10),
                                          height: height*0.12,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white,
                                              border: Border.all(color: primary,width: 0.8)
                                          ),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 10,right: 10),
                                                height: MediaQuery.of(context).size.height*0.07,
                                                width: MediaQuery.of(context).size.height*0.07,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(360),

                                                ),
                                                child: CachedNetworkImage(
                                                  imageBuilder: (context, imageProvider) => Container(
                                                    height: MediaQuery.of(context).size.height*0.07,
                                                    width: MediaQuery.of(context).size.height*0.07,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: imageProvider, fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  imageUrl: data.get('doctorProfile'),
                                                  placeholder: (context, url) => CircularProgressIndicator(
                                                    valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                                                        Text(data.get("doctorName"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                                                        Container(
                                                          padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                                          margin: EdgeInsets.only(right: 10),
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Colors.green[600],
                                                              borderRadius: BorderRadius.circular(30)
                                                          ),
                                                          child:Text("Completed", style: TextStyle(color: Colors.white,fontSize: 12),),
                                                        )

                                                      ],
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(data.get("doctorSpeciality"),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child:Row(
                                                            children: [
                                                              Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 15,),
                                                              Text(convertDateTimeDisplay(DateTime.fromMillisecondsSinceEpoch(data.get('date') ).toString()),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child:Row(
                                                            children: [
                                                              Icon(Icons.timer,color: Colors.grey,size: 15,),
                                                              Text(data.get('sessionHours').toString(),style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child:Row(
                                                            children: [
                                                              Icon(Icons.monetization_on,color: Colors.grey,size: 15,),
                                                              Text("\$${data.get('sessionPrice').toString()}",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                        );

                                      }
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


  Future<List<ParseObject>> getUpcoming() async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;

    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('reservation'))..whereEqualTo("userId", currentUser.objectId.toString())..whereEqualTo("status", "pending");
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
  Future<List<ParseObject>> getCompleted() async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;

    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('reservation'))..whereEqualTo("userId", currentUser.objectId.toString())..whereEqualTo("status", "completed");
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}

