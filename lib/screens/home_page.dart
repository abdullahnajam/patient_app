import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/Model/DoctorModel.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/screens/NotificationScreen.dart';
import 'package:patient_app/screens/booking_history.dart';
import 'package:patient_app/screens/DoctorProfile.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CategoryScreen.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  UserModel model;

  HomePage(this.model);

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

  final FirebaseAuth auth = FirebaseAuth.instance;
  String getUid() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return uid;
    // here you write the codes to input the data into firestore
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.04;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.08,
              left: MediaQuery.of(context).size.width*0.05,
              right: MediaQuery.of(context).size.width*0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi, ${widget.model.fullName}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                    InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NotificationScreen()));
                        },
                        child: Icon(Icons.notifications,color: Colors.white,))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Text("consult your therapist online\nthrough Audio, Video or Text",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
              ],
            )
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
                  height:  MediaQuery.of(context).size.height*0.07,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.05,
                    right: MediaQuery.of(context).size.width*0.05
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.search_outlined,color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text("Search Doctor",style: TextStyle(color: Colors.grey,),),
                        ],
                      ),
                      Container(
                        height:  MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.height*0.07,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset('assets/icons/filter_icon.png'),
                        ),
                      )
                    ],

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, vertical: 5),
                  child: Text("Special Offers",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance.collection('offers').get(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError) {
                        return  Column(
                          children: [
                            SizedBox(height : size.height*0.07),
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
                            SizedBox(height : size.height*0.07),
                            Center(child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(primary),
                            ),),
                          ],
                        );
                      }

                      if(snapshot.data!.size == 0)
                      {
                        return Column(
                          children: [
                            SizedBox(height : size.height*0.07),

                            const Center(child: Text('No Offers',style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600
                            ),)),
                          ],
                        );


                      }

                      return ListView(
                        
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),

                            ),
                            child: CachedNetworkImage(

                              imageBuilder: (context, imageProvider) => Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width*0.05,
                                  right: MediaQuery.of(context).size.width*0.05,
                                ),
                                height : height *0.2,
                                width : width *0.9,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              imageUrl: data["banner"],
                              placeholder: (context, url) => Container(
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
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),

                  /* PageView(
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
                  ),*/
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


                Container(
                  margin: EdgeInsets.symmetric(horizontal: margin, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoryScreen()));

                        },
                          child: Text("View All",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 12),)),
                    ],
                  ),


                ),

                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('categories').limit(3).get(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return  Column(
                        children: [
                          SizedBox(height : size.height*0.07),
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
                          SizedBox(height : size.height*0.07),
                          Center(child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(primary),
                          ),),
                        ],
                      );
                    }

                    if(snapshot.data!.size == 0)
                    {
                      return Container(
                        height: height*0.25,
                        margin: EdgeInsets.only(left: margin, right: margin),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [COLOR_LIGHT_BLUE, COLOR_LIGHT_PURPLE],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child:  Center(child: Text('No Categories',style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),)),
                      );

                    }

                    return Container(
                      height: MediaQuery.of(context).size.width*0.3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          //Reser model= DoctorModel.fromMap(data, document.reference.id);
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              height: MediaQuery.of(context).size.width*0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                 // color: Color(0xff42225D),

                                  color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child:  Column(
                                children: [
                                  SizedBox(
                                    height : height*0.015,
                                  ),
                                  Center(
                                    child: CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) => Container(
                                        height: MediaQuery.of(context).size.height*0.08,
                                        width: MediaQuery.of(context).size.height*0.08,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover),
                                        ),
                                      ),
                                      imageUrl: data['image'],
                                      placeholder: (context, url) => CircularProgressIndicator(
                                        valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                  Align(
                                    alignment : Alignment.bottomCenter,
                                    child: Text(data['type'],style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),



             /*   Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(placeHolderLandScape),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(placeHolderLandScape),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.width*0.3,
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
                ),*/
                Container(
                  margin: EdgeInsets.symmetric(horizontal: margin, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Upcoming Schedule",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BookingHisttory(widget.model)));
                          },
                          child: Text("View All",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 12),)),
                    ],
                  ),
                ),

                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('reservation').where('userId' , isEqualTo: getUid()).where("status" , isEqualTo: "pending").limit(1).orderBy('date').get(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return  Column(
                        children: [
                          SizedBox(height : size.height*0.07),
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
                          SizedBox(height : size.height*0.07),
                          Center(child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(primary),
                          ),),
                        ],
                      );
                    }

                    if(snapshot.data!.size == 0)
                    {
                      return Container(
                        height: height*0.25,
                        margin: EdgeInsets.only(left: margin, right: margin),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [COLOR_LIGHT_BLUE, COLOR_LIGHT_PURPLE],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child:  Center(child: Text('No Appointment',style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),)),
                      );

                    }

                    return ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        //Reser model= DoctorModel.fromMap(data, document.reference.id);
                        return Container(
                          height: height*0.25,
                          margin: EdgeInsets.only(left: margin, right: margin),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [COLOR_LIGHT_BLUE, COLOR_LIGHT_PURPLE],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Container(
                                  height: MediaQuery.of(context).size.height*0.1,
                                  width: MediaQuery.of(context).size.height*0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                     /* image: DecorationImage(
                                          image: AssetImage(placeHolderLandScape),
                                          fit: BoxFit.cover
                                      )*/
                                  ),
                                  child: CachedNetworkImage(
                                    imageBuilder: (context, imageProvider) => Container(
                                      height: MediaQuery.of(context).size.height*0.01,
                                      width: MediaQuery.of(context).size.height*0.08,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: imageProvider, fit: BoxFit.cover),
                                      ),
                                    ),
                                    imageUrl: data['doctorProfile'],
                                    placeholder: (context, url) => CircularProgressIndicator(
                                      valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                title: Text(data['doctorName'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
                                subtitle: Text(data['doctorSpeciality'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
                                trailing: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.videocam_outlined,),
                                ),
                              ),
                              Container(
                                height: height*0.08,
                                margin: EdgeInsets.all(margin),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: blue,
                                    border: Border.all(color: Colors.white,width: 0.8)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timer,color: Colors.grey[200],),
                                    SizedBox(width: 10,),
                                    Text("${convertDateTimeDisplay(DateTime.fromMillisecondsSinceEpoch(data['date'] ).toString()) }    ${data["time"]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: margin, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Doctors",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                      Text("View All",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 12),),
                    ],
                  ),
                ),

                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection('doctor').limit(1).get(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
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

                    if(snapshot.data!.size == 0)
                    {
                      return Column(
                        children: [
                          SizedBox(height : size.height*0.3),
                          const Center(child: Text('No Doctors',style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600
                          ),)),
                        ],
                      );


                    }

                    return ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        DoctorModel model= DoctorModel.fromMap(data, document.reference.id);
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorProfile(model)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: margin, right: margin),
                            height: height*0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xfff5f4fa),
                                border: Border.all(color: primary,width: 0.8)
                            ),


                            // Calling for doctor data
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: height*0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.1,
                                        width: MediaQuery.of(context).size.height*0.1,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            image: DecorationImage(
                                                image: AssetImage(placeHolderLandScape),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                        child: CachedNetworkImage(
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: MediaQuery.of(context).size.height*0.1,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: imageProvider, fit: BoxFit.cover),
                                            ),
                                          ),
                                          imageUrl: model.profile,
                                          placeholder: (context, url) => CircularProgressIndicator(
                                            valueColor: new AlwaysStoppedAnimation<Color>(primary),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(model.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                                          Text(model.speciality,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 10),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.place,color: primary,size: 20,),
                                              SizedBox(width: 2,),
                                              Text(model.location,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 12),),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset("assets/icons/money.png",width: 20,height: 20,),
                                              SizedBox(width: 2,),
                                              Text("\$${model.sessionFees.toString()}/hr",style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 12),),

                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: COLOR_YELLOW,),
                                          Text(model.rating.toString())
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height*0.05,
                                    width: width*0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            primary,
                                            blue,
                                          ],
                                        )
                                    ),
                                    child: Text("Book Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),
                                  ),
                                )
                              ],
                            ),



                          ),
                        );

                      }).toList(),
                    );
                  },
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
