import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/screens/NotificationScreen.dart';
import 'package:patient_app/screens/booking_history.dart';
import 'package:patient_app/screens/profile.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'CategoryScreen.dart';

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

  int counter = 0;
  @override
  Widget build(BuildContext context) {
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
                    Text("Hi, Ayman",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
                Container(
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
                ),
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
                                        BookingHisttory()));
                          },
                          child: Text("View All",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 12),)),
                    ],
                  ),
                ),
                Container(
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
                              image: DecorationImage(
                                  image: AssetImage(placeHolderLandScape),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        title: Text("Dr. Harley Lawrance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
                        subtitle: Text("Psychologist",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),),
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
                            Text("Fri, July, 08:00 am - 10:00 am",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
                          ],
                        ),
                      )
                    ],
                  ),
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
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorProfile()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: margin, right: margin),
                    height: height*0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfff5f4fa),
                        border: Border.all(color: primary,width: 0.8)
                    ),
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
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
                                  Text("Psychologist",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 10),),
                                  Text("18 Years Experience",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 12),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.place,color: primary,size: 20,),
                                      SizedBox(width: 2,),
                                      Text("Miami, USA",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 12),),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/icons/money.png",width: 20,height: 20,),
                                      SizedBox(width: 2,),
                                      Text("\$20/hr",style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 12),),

                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: COLOR_YELLOW,),
                                  Text("4.5")
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
