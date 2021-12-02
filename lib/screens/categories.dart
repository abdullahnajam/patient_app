import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/DoctorModel.dart';
import 'package:patient_app/screens/filter.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:patient_app/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  String type;

  Categories(this.type);

 // const Categories({Key? key}) : super(key: key);


  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
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
                    Text("Category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.search_outlined,size: 30,color: Colors.grey[300],),
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
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FilterScreen()));
                        },
                        child: Container(
                          width: width*0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Icon(Icons.filter_alt_rounded,size: 18),
                              Text("  Filter",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 12),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(widget.type, style: TextStyle(
                          fontSize: 12,
                          color: COLOR_GREY
                      ),),
                    ),
                  ),
                ),

                Expanded(
                  flex : 83,
                  child: FutureBuilder<List<ParseObject>>(
                    future: getDoctor(),
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

                      if(snapshot.data!.isEmpty)
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

                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context,int index){
                            final data = snapshot.data![index];

                            print(data.objectId.toString());
                            print(data.get<String>("name").toString());
                            print(data.get("rating"));


                            DoctorModel model= DoctorModel(data.objectId.toString(),
                                data.get<String>("name").toString(),
                                data.get<String>("profile").toString(),
                                data.get<String>("speciality").toString(),
                                data.get("sessionFees"),
                                data.get<String>("description").toString(),
                                data.get<String>("availibility").toString(),
                                data.get<String>("location").toString(),
                                data.get("rating"));
                            return DoctorCard(model);
                          }

                      );
                    },
                  ),

                ),


                /*          Expanded(
                  flex : 83,
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance.collection('doctor').get(),
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
                        );;
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
                          return DoctorCard(model);
                        }).toList(),
                      );
                    },
                  ),

                ),*/

              ],
            ),
          )
      ),
    );
  }
  Future<List<ParseObject>> getDoctor() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('DoctorData'))..whereEqualTo('speciality', widget.type);
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
