import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:patient_app/screens/profile.dart';
import 'package:patient_app/utils/constants.dart';


class DoctorCard extends StatefulWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorProfile()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Dr. Navida Navara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),),
                          SizedBox(height: 3,),
                          Text("Psychologist",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 10),),
                          SizedBox(height: 3,),
                         Row(
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
                             SizedBox(width: 4,),
                             Text("50",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),
                           ],
                         ),
                          SizedBox(height: 3,),
                         Row(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.place,color: primary,size: 20,),
                                 SizedBox(width: 2,),
                                 Text("Miami, USA",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),

                               ],
                             ),

                             SizedBox(width: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Image.asset("assets/icons/money.png",width: 20,height: 20,),
                                 SizedBox(width: 2,),
                                 Text("\$20/hr",style: TextStyle(color: blue,fontWeight: FontWeight.w300,fontSize: 12),),

                               ],
                             )
                           ],
                         )

                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.favorite_border),
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
                child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),
              ),
            )
          ],
        ),

      ),
    );
  }
}
