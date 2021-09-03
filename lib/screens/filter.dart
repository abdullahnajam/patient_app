import 'package:flutter/material.dart';

import 'constants.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _availability = false;
  bool _location = false;
  double _value=20;
  List<String> categroyList=['Depression', 'Anxiety', 'Children', 'Relationship'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.all(margin),
        child: ListView(
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
                Text("Filter",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.search_outlined,size: 30,color: Colors.grey[400],),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child:  Text("Availability",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  SwitchListTile(
                    title: Text('Availability Today',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    value: _availability,
                    onChanged: (bool value) {
                      setState(() {
                        _availability = value;
                      });
                    },
                  ),
                  Container(
                    width: width,
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(5),
                    child:  Text("Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  SwitchListTile(
                    title: Text('Location',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    value: _location,
                    onChanged: (bool value) {
                      setState(() {
                        _location = value;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child:TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.5
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.5,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Search by location",

                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child:  Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: new GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth*2 / itemHeight*3),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: categroyList.map((String value) {
                        return new Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)
                          ),
                          margin: new EdgeInsets.all(5),
                          child: new Center(
                            child: new Text(
                              value,
                              style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("View All",style: TextStyle(color:blue,fontWeight: FontWeight.bold,fontSize: 14),),
                      SizedBox(width: 5,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: width,
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(5),
                    child:  Text("Price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25,right: 25,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$20",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("\$250",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.deepPurple,
                      inactiveTrackColor: Colors.deepPurple,
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: Colors.deepPurple,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayColor: Colors.deepPurple.withAlpha(32),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),
                    child: Slider(
                      min: 20,
                      max: 100,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookAppointment()));

                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(margin),
                      decoration: BoxDecoration(
                        gradient: colorGradient,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Center(
                        child:Text("Reset",style: TextStyle(color: Colors.white,fontSize: 16),),

                      )
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BookAppointment()));

                    },
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.all(margin),
                        decoration: BoxDecoration(
                          gradient: colorGradient,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Center(
                          child:Text("Filter Now",style: TextStyle(color: Colors.white,fontSize: 16),),

                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
