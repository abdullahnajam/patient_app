import 'package:patient_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(margin),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: colorGardient,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.add,color: Colors.white,size: 35,),
            ),
            Expanded(

              child: Container(
                margin: EdgeInsets.only(left: margin,right: margin),
                child: TextFormField(

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.5
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: "Type a message",
                    suffixIcon: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.send_outlined,color: blue,),
                    ),
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
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
                    Expanded(
                      child: ListTile(
                        leading: Container(
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                            border: Border.all(color: blue),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/placeholder/doctor.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        title: Text("Dr. Harley",maxLines: 1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 15),),
                        subtitle: Text("last seen 1 hour ago",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 10),),

                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/icons/call.png",width: 20,height: 20,color: primary,),
                        SizedBox(width: 10,),
                        Image.asset("assets/icons/phone.png",width: 20,height: 20,color: primary,)
                      ],
                    )

                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: width*0.7,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                                )
                              ),
                              child: Text("Good Morning Jimmy!",style: TextStyle(color: Colors.grey,),),
                            ),
                            SizedBox(height: 5,),
                            Text("08:00",style: TextStyle(color: Colors.grey,),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: width*0.7,
                              decoration: BoxDecoration(
                                  gradient: colorGardient,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Text("Good Morning Doc!",style: TextStyle(color: Colors.white,),),
                            ),
                            SizedBox(height: 5,),
                            Text("08:01",style: TextStyle(color: Colors.grey,),),
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
