import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/Navigator/BottomNav.dart';
import 'package:patient_app/screens/MenuScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

import 'constants.dart';

class EditProfile extends StatefulWidget {
  UserModel model;

  EditProfile(this.model);

  @override
  _EditProfileState createState() => _EditProfileState();
}
enum gender { male, female }
class _EditProfileState extends State<EditProfile> {


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  gender? _gender ;
  bool changed = false;
  @override
  void initState() {
    name.text = widget.model.fullName ;
    email.text = widget.model.email ;
    number.text = widget.model.phoneNo ;
    widget.model.gender == "male" ? _gender = gender.male : _gender = gender.female ;

    super.initState();
  }

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
/*
                Icon(Icons.search,color: Colors.grey,size: 30,)
*/
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
          Form(
            key: _formKey,
            child: Container(

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
                      child: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 22),)
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          child:TextFormField(
                            //readOnly: true,

                            controller: name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value){
                              setState(() {
                                changed = true;
                              });
                            },

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color : Colors.black54,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
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
                        Text("E-mail",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          child:TextFormField(
                            readOnly: true,

                            controller: email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color : Colors.black54,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
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
/*                      Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
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
                              contentPadding: EdgeInsets.all(14),
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
                        ),*/
                        SizedBox(height: 10,),
                        Text("Mobile Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                             /* InkWell(
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
                              ),*/
                              Expanded(
                                child: TextFormField(
                                  //readOnly: true,
                                  controller: number,
                                  onChanged: (value){
                                    setState(() {
                                      changed = true;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },

                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color : Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(14),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,8,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gender',
                                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                              ),
                              Row(
                                children: [
                                  new Radio(
                                    value: gender.male,
                                    groupValue: _gender,
                                    onChanged: (gender? value) {
                                      setState(() {
                                        _gender = value!;
                                        changed = true;
                                      });
                                    },
                                  ),
                                  new Text(
                                    'Male',
                                    style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),
                                  ),
                                  new Radio(
                                    value: gender.female,
                                    groupValue: _gender,
                                    activeColor: blue,
                                    onChanged: (gender? value) {
                                      setState(() {
                                        _gender = value!;
                                        changed = true;

                                      });
                                    },
                                  ),
                                  new Text(
                                    'Female',
                                    style: new TextStyle(
                                        color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                           // Navigator.pop(context);
                            print(changed);

                            if(_formKey.currentState!.validate() && changed == true)
                            {
                              editProfile();
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.all(margin),
                            decoration: BoxDecoration(
                              gradient:  changed == false ? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.grey,
                                  Colors.grey.shade900,
                                ],
                              ) : colorGradient,
                              borderRadius: BorderRadius.circular(30),

                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> editProfile() async {
    ParseUser currentUser = await ParseUser.currentUser() as ParseUser;

    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ),
    );
    pr.show();
    var todo = ParseObject('userData')
      ..objectId = widget.model.objectId
      ..set("email", email.text.trim())
      ..set("fullName", name.text.trim())
      ..set("phoneNo", number.text.trim())
      ..set("type", 'patient')
      ..set('userObjectId', widget.model.userObjectId)
      ..set("gender" , _gender == gender.male ? "male" : "female");
    await todo.save();

    final ParseResponse parseResponse = await todo.save();

    if (parseResponse.success) {
      pr.hide();
      //var objectIds = (parseResponse.results!.first as ParseObject).objectId!;
      setState(() {


      });
      UserModel model = UserModel(todo.objectId.toString(),name.text.trim().toString(),email.text.trim().toString(),number.text.trim().toString(), _gender == gender.male ? "male" : "female",'patient',widget.model.userObjectId);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(model)));

      // Toast.show("Registered", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    } else {
      pr.hide();
      Toast.show('Object created with failed: ${parseResponse.error.toString()}', context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);

    }
  }

/*  void editProfile()async
  {
    final ProgressDialog pr = ProgressDialog(context);
    pr.style(
      message: 'Please Wait...',
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ),
    );
    pr.show();
    User? user = FirebaseAuth.instance.currentUser;
    await userDetails.doc(user!.uid).update({
      "email": user.email.toString(),
      "fullName": name.text.trim(),
      "phoneNo": number.text.trim(),
      "type": 'patient',
      "gender" : _gender == gender.male ? "male" : "female",
    }).onError((error, stackTrace) {
      Toast.show(error.toString(), context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
    }).then((value) {

      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        UserModel model= UserModel.fromMap(data, documentSnapshot.reference.id);
        pr.hide();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MenuScreen(model)));
        setState(() {
          Toast.show("Updated", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP , textColor: primary , backgroundColor: Colors.white);
        });
      });

    });

 }*/




}
