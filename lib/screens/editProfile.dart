import 'package:flutter/material.dart';

import 'constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}
enum gender { male, female }
class _EditProfileState extends State<EditProfile> {
  gender _gender = gender.male;
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
                Icon(Icons.search,color: Colors.grey,size: 30,)
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
                  height: width*0.3,
                  margin: EdgeInsets.only(
                      left: width*0.35,
                      right: width*0.35
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/placeholder/doctor.png"),
                          fit: BoxFit.cover
                      )
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                    alignment: Alignment.center,
                    child: Text("Edit Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 22),)
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                      SizedBox(height: 10,),
                      Container(
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
                            hintText: "User Name",

                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Text("E-mail",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                      SizedBox(height: 10,),
                      Container(
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
                            hintText: "User Email",

                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                      SizedBox(height: 10,),
                      Container(
                        child:TextFormField(
                          obscureText: true,
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
                            hintText: "User Password",

                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Image.asset('assets/icons/flag.jpg',width: 20,height: 20,),
                                    Icon(Icons.arrow_drop_down,color: Colors.grey,)
                                  ],
                              ),
                            ),
                            Container(
                              height: 50,
                              child: VerticalDivider(color: Colors.grey),
                            ),
                            Expanded(
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
                                  hintText: "Mobile Number",

                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                ),
                              ),
                            )
                          ],
                        )
                      ),

                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gender',
                            style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),
                          ),
                          Row(
                            children: [
                              new Radio(
                                value: gender.male,
                                groupValue: _gender,
                                onChanged: (gender? value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              new Text(
                                'Male',
                                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),
                              ),
                              new Radio(
                                value: gender.female,
                                groupValue: _gender,
                                activeColor: blue,
                                onChanged: (gender? value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              new Text(
                                'Female',
                                style: new TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.all(margin),
                          decoration: BoxDecoration(
                            gradient: colorGradient,
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                              Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,)
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
