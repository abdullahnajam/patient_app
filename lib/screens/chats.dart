import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  _UserChatsState createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.03;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Row(
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
                  Text("Chat",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.notifications,size: 30,color: blue,),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: margin, right: margin, top: margin),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child:Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.search_outlined,color: Colors.grey,),
                  SizedBox(width: 10,),
                  Text("Search Here",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 16),)
                ],
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context,int index){
                  return  Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      shape: BoxShape.circle,

                    ),
                    child: Container(
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
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: margin,right: margin),
              child:Divider(color: Colors.grey,) ,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return  Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: margin,right: margin),
                      child: Row(
                        children: [
                          Container(
                            height:50,
                            width: 50,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("John Smith",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),
                                      SizedBox(height: 2,),
                                      Text("Hello!",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 14),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Text("10:55 AM",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),
                                      SizedBox(height: 2,),
                                      Container(
                                        height:20,
                                        width: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green
                                        ),
                                        child: Text("2",style: TextStyle(color: Colors.white,fontSize: 12),),

                                      ),
                                    ],
                                  )
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: margin,right: margin),
                      child:Divider(color: Colors.grey,) ,
                    )

                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
