import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:patient_app/utils/constants.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
                        Navigator.pop(context);
                      },
                      child:  CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                      ),
                    ),
                    Text("Favourite",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.search_outlined,size: 30,color: Colors.grey[300],),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/placeholder/doctor.png"),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                        )
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                                        Text("Psychologist",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 10),),
                                        SizedBox(width: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RatingBar(
                                              initialRating: 4,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: Icon(Icons.star,color: COLOR_YELLOW),
                                                half: Icon(Icons.star_half,color: COLOR_YELLOW),
                                                empty:Icon(Icons.star_border,color: COLOR_YELLOW,),
                                              ),
                                              ignoreGestures: true,
                                              itemSize: 15,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            SizedBox(width: 5,),
                                            Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),


                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        Text("\$20/hr",style: TextStyle(color: primary,fontWeight: FontWeight.w500,fontSize: 12),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/placeholder/doctor.png"),
                                            fit: BoxFit.cover
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                        )
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                                        Text("Psychologist",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 10),),
                                        SizedBox(width: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RatingBar(
                                              initialRating: 4,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: Icon(Icons.star,color: COLOR_YELLOW),
                                                half: Icon(Icons.star_half,color: COLOR_YELLOW),
                                                empty:Icon(Icons.star_border,color: COLOR_YELLOW,),
                                              ),
                                              ignoreGestures: true,
                                              itemSize: 15,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            SizedBox(width: 5,),
                                            Text("4.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),


                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        Text("\$20/hr",style: TextStyle(color: primary,fontWeight: FontWeight.w500,fontSize: 12),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                )

              ],
            ),
          )
      ),
    );
  }
}
