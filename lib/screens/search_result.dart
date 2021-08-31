import 'package:patient_app/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
                  Text("Search Results",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.search_outlined,size: 30,color: Colors.grey[400],),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: height*0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Row(
                  children: [
                    Container(
                      width: width*0.3,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Rated",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 12),),
                          Icon(Icons.keyboard_arrow_down,size: 18,)
                        ],
                      ),

                    ),
                    VerticalDivider(color: Colors.grey,),
                    Container(
                      width: width*0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(Icons.sort,size: 18),
                          Text("  Sort",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 12),),
                        ],
                      ),

                    ),
                    VerticalDivider(color: Colors.grey,),
                    Container(
                      width: width*0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(Icons.filter_alt_rounded,size: 18),
                          Text("  Filter",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 12),),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context,int index){
                    return DoctorCard();
                  },
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
