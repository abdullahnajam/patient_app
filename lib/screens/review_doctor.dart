import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'constants.dart';

class ReviewDoctor extends StatefulWidget {
  const ReviewDoctor({Key? key}) : super(key: key);

  @override
  _ReviewDoctorState createState() => _ReviewDoctorState();
}

class _ReviewDoctorState extends State<ReviewDoctor> {
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
                    child: Text("Doctor Rate",style: TextStyle(color: Colors.white,fontSize: 20),),
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

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar(
                          initialRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star,color: primary),
                            half: Icon(Icons.star_half,color: primary),
                            empty:Icon(Icons.star_border,color: primary,),
                          ),
                          itemSize: 50,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),


                      ],
                    ),
                    SizedBox(height: 10,),

                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "\"Kindly rate your experience\"",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 18,),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: margin,right: margin,top: margin),

                      child: TextFormField(

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        maxLines: 5,
                        minLines: 4,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.5
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.5,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter Review",
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(

                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey)
                                  ),
                                  child: Image.asset("assets/icons/sad.png",height: 40,width: 40,fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 5,),
                                Text("Bad",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: Image.asset("assets/icons/good.png",height: 40,width: 40,fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 5,),
                                Text("Good",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: Image.asset("assets/icons/smiling.png",height: 40,width: 40,fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 5,),
                                Text("Very Good",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: Image.asset("assets/icons/happy.png",height: 40,width: 40,fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 5,),
                                Text("Excellent",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                          Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,)
                        ],
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
