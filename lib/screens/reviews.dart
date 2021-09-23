import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left:10, right:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.arrow_back_ios_rounded,color: COLOR_DARK_BLUE,),
                    ),
                  ),
                  Text("Review",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.notifications,size: 30,color: blue,),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(margin),
                  height: height*0.25,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.reply,color: Colors.white,size: 15,),
                                Text("Reply",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10),)

                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.favorite,color: Colors.white,size: 15,),
                                Text("Like (21)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10),)

                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(margin),
                            height:100,
                            width: 100,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: margin,),
                                Text("John Smith",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22),),
                                Text("Age: 42 , Female",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                                Row(
                                  children: [
                                    Icon(Icons.place,color: Colors.white,size: 14,),
                                    Text("Miami, USA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),)
                                  ],
                                ),
                                Text("The doctor was calm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),)

                              ],
                            ),
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
                    margin: EdgeInsets.only(top: height*0.245),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5.0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        SizedBox(width: 5,),
                        Text("Review",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                        SizedBox(width: 5,),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return  Container(
                  margin: EdgeInsets.fromLTRB(margin,10,margin, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 0.8),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(margin),
                        height:60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/placeholder/doctor.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Smith",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                            Text("Age: 52, Female",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 14),),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("5.0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                                SizedBox(width: 5,),
                                Text("Review",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                                SizedBox(width: 5,),
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
                                  itemSize: 15,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
