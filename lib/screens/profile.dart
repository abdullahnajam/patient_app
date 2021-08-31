import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'book_appointment.dart';
import 'constants.dart';
import 'message.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      body: Stack(
         children: [
           Container(
               color: primary,
               height: MediaQuery.of(context).size.height*0.3,
               padding: EdgeInsets.only(
                 top:MediaQuery.of(context).size.height*0.08,
                 left: MediaQuery.of(context).size.width*0.05,
                 right: MediaQuery.of(context).size.width*0.05,
               ),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child:  CircleAvatar(
                       backgroundColor: Colors.grey[200],
                       child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                     ),
                   ),
                   Icon(Icons.favorite,color: Colors.red,)
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
           ),
           Container(
             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.125),
             height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.125,
             child: ListView(
               children: [
                 Container(
                   height: width*0.4,
                   margin: EdgeInsets.only(
                     left: width*0.3,
                     right: width*0.3
                   ),
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
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.white,width: 2),
                     image: DecorationImage(
                       image: AssetImage("assets/placeholder/doctor.png"),
                       fit: BoxFit.cover
                     )
                   ),
                 ),
                 Column(
                   children: [
                     SizedBox(height: 30,),
                     Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                     Text("Psychologist",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15),),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         RatingBar(
                           initialRating: 4,
                           direction: Axis.horizontal,
                           allowHalfRating: true,
                           itemCount: 5,
                           ratingWidget: RatingWidget(
                             full: Icon(Icons.star,color: primary),
                             half: Icon(Icons.star_half,color: primary),
                             empty:Icon(Icons.star_border,color: primary,),
                           ),
                           ignoreGestures: true,
                           itemSize: 20,
                           itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                           onRatingUpdate: (rating) {
                             print(rating);
                           },
                         ),
                         SizedBox(width: 5,),
                         Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                         SizedBox(width: 5,),
                         Text("(128 Reviews)",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),

                       ],
                     ),
                     SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 50,
                           width: 50,
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                                color: Color(0xffeae0df)
                           ),
                           child: Image.asset('assets/icons/phone.png',width: 50,height: 50,fit: BoxFit.cover,color: Color(0xffef6b61),),
                         ),
                         SizedBox(width: 30,),
                         Container(
                           height: 50,
                           width: 50,
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Color(0xffe4e7f8)
                           ),
                           child: Image.asset('assets/icons/call.png',width: 50,height: 50,fit: BoxFit.cover,color: Color(0xff3253f0),),
                         ),
                         SizedBox(width: 30,),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
                           },
                           child: Container(
                             height: 50,
                             width: 50,
                             padding: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Color(0xfffaefdc)
                             ),
                             child: Image.asset('assets/icons/chat.png',width: 50,height: 50,fit: BoxFit.cover,color: Color(0xfffeaf39),),
                           ),
                         ),
                        

                       ],
                     ),
                     Container(
                       margin: EdgeInsets.all(margin),
                         child: Divider(color: Colors.grey[400],),
                     ),
                     Container(
                       alignment: Alignment.center,
                       child: Text(
                         "Lorem ipsum, or lipsum as it is some times wn is \ndummy text used in laying out print",
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15,),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: margin,right: margin,top: margin),
                       decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 2,
                               blurRadius: 2,
                               offset: Offset(0, 2), // changes position of shadow
                             ),
                           ],
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Color(0xffe0e0e0)),
                           color: Colors.white
                       ),
                       child: ListTile(
                         leading: Container(
                           height: MediaQuery.of(context).size.height*0.1,
                           width: MediaQuery.of(context).size.height*0.08,
                           decoration: BoxDecoration(
                              gradient: colorGardient,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Icon(Icons.calendar_today_rounded,color: Colors.white,),
                         ),
                         title: Text("Availability",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
                         subtitle: Text("08:00 AM - 05:00 AM",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),

                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: margin,right: margin,top: margin),
                       decoration: BoxDecoration(
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                               spreadRadius: 2,
                               blurRadius: 2,
                               offset: Offset(0, 2), // changes position of shadow
                             ),
                           ],
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Color(0xffe0e0e0)),
                           color: Colors.white
                       ),
                       child: ListTile(
                         leading: Container(
                           height: MediaQuery.of(context).size.height*0.1,
                           width: MediaQuery.of(context).size.height*0.08,
                           decoration: BoxDecoration(
                               gradient: colorGardient,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Icon(Icons.location_on_rounded,color: Colors.white,),
                         ),
                         title: Text("Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
                         subtitle: Text("Miami , USA",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),

                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: margin,top: margin,bottom: 10),
                       alignment: Alignment.centerLeft,
                       child: Text("Session Fee",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                     ),
                     Container(
                       margin: EdgeInsets.only(left: margin),
                       child: Row(
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text("Duration",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 18),),
                               SizedBox(height: 3,),
                               Container(
                                 height: 50,
                                 alignment: Alignment.center,
                                 padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     gradient: LinearGradient(
                                       begin: Alignment.centerLeft,
                                       end: Alignment.centerRight,
                                       colors: [
                                         Color(0xffbb46ea),
                                         Color(0xff5c7cf9),
                                       ],
                                     )
                                 ),
                                 child: Text("30 min",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                               )
                             ],
                           ),
                           SizedBox(width: 30,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text("Price",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 18),),
                               SizedBox(height: 3,),
                               Container(
                                 height: 50,
                                 alignment: Alignment.center,
                                 padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     gradient: LinearGradient(
                                       begin: Alignment.centerLeft,
                                       end: Alignment.centerRight,
                                       colors: [
                                         Color(0xff3ac5e4),
                                         Color(0xff359efa),
                                       ],
                                     )
                                 ),
                                 child: Text("20 USD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                               )
                             ],
                           )
                         ],
                       )
                     ),
                     Container(
                       margin: EdgeInsets.all(margin),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Reviews",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                           Text("More",style: TextStyle(color: blue,fontWeight: FontWeight.bold,fontSize: 15),),
                         ],
                       ),
                     ),
                     Container(

                       margin: EdgeInsets.only(top: 10,left: margin,right: margin),
                       height: height*0.12,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.white,
                           border: Border.all(color: primary,width: 0.8)
                       ),
                       child: Container(

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
                                   image: DecorationImage(
                                       image: AssetImage(placeHolderLandScape),
                                       fit: BoxFit.cover
                                   )
                               ),
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("John Smith",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                                     SizedBox(width: 10,),
                                     Row(
                                       children: [
                                         RatingBar(
                                           initialRating: 4,
                                           direction: Axis.horizontal,
                                           allowHalfRating: true,
                                           itemCount: 5,
                                           ratingWidget: RatingWidget(
                                             full: Icon(Icons.star,color: primary),
                                             half: Icon(Icons.star_half,color: primary),
                                             empty:Icon(Icons.star_border,color: primary,),
                                           ),
                                           ignoreGestures: true,
                                           itemSize: 15,
                                           itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                           onRatingUpdate: (rating) {
                                             print(rating);
                                           },
                                         ),
                                         SizedBox(width: 5,),
                                         Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),),

                                       ],
                                     ),
                                   ],
                                 ),
                                 SizedBox(height: 3,),
                                 Text("Awesome doctor , will visit again",
                                   style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),

                                 SizedBox(height: 3,),

                               ],
                             ),
                           ],
                         ),
                       ),

                     ),
                     SizedBox(height: 10,),
                     InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookAppointment()));

                       },
                       child: Container(
                         height: 50,
                         margin: EdgeInsets.all(margin),
                         decoration: BoxDecoration(
                           gradient: colorGardient,
                           borderRadius: BorderRadius.circular(30),

                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Book Appointment",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                             SizedBox(width: 5,),
                             Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                             Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,)
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                     

                   ],
                 )
               ],
             ),
           )
         ],
      ),
    );
  }
}
