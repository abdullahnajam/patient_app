import 'package:date_format/date_format.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'BookAppointmentScreen.dart';
import 'ChatScreen.dart';
import 'MainScreen.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var margin = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [COLOR_LIGHT_BLUE,COLOR_LIGHT_PURPLE],
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
              ),),
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: COLOR_DARK_BLUE,
                    ),
                  ),
                ),
                Text(
                  "Update",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: COLOR_WHITE),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            height: MediaQuery.of(context).size.height,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.125),
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.125,
              child: ListView(children: [
                Container(
                  height: width * 0.4,
                  margin:
                      EdgeInsets.only(left: width * 0.3, right: width * 0.3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage("assets/placeholder/doctor.png"),
                          fit: BoxFit.cover)),
                ),
              ])),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.380),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height * 0.125,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height *1.55,
                        child: Column(

                            children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text(
                                  "40%",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: LinearProgressIndicator(
                                    value: 0.4,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                            color: Colors.grey[500]!)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 4,
                                          bottom: 4),
                                      child: Text(
                                        "Complete Your Profile",
                                        style: TextStyle(
                                            color: COLOR_DARK_BLUE,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  style: TextStyle(
                                      color: COLOR_GREY, fontSize: 14),
                                  cursorColor: COLOR_GREY,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(Icons.person),
                                      hintStyle: TextStyle(
                                          color: COLOR_GREY, fontSize: 14),
                                      hintText: "Name",
                                      fillColor: Colors.white70,
                                      labelStyle: TextStyle(color: COLOR_GREY)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  style: TextStyle(
                                      color: COLOR_GREY, fontSize: 14),
                                  cursorColor: COLOR_GREY,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintStyle: TextStyle(
                                          color: COLOR_GREY, fontSize: 14),
                                      hintText: "Email",
                                      fillColor: Colors.white70,
                                      labelStyle: TextStyle(color: COLOR_GREY)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InternationalPhoneNumberInput(
                                  textStyle: TextStyle(
                                      color: COLOR_GREY, fontSize: 14),
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.DROPDOWN,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      TextStyle(color: Colors.black),
                                  formatInput: false,
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  inputBorder: OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                DropdownSearch<String>(
                                  validator: (v) =>
                                      v == null ? "required field" : null,
                                  hint: "Select Speciality",
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: [
                                    "Speciality 1",
                                    "Speciality 2",
                                    "Speciality 3",
                                    'Speciality 4'
                                  ],
                                  showClearButton: true,
                                  onChanged: print,
                                  clearButtonSplashRadius: 20,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                DropdownSearch<String>(
                                  validator: (v) =>
                                      v == null ? "required field" : null,
                                  hint: "Select Category",
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: [
                                    "Category 1",
                                    "Category 2",
                                    "Category 3",
                                    'Category 4'
                                  ],
                                  showClearButton: true,
                                  onChanged: print,
                                  clearButtonSplashRadius: 20,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                DropdownSearch<String>(
                                  validator: (v) =>
                                      v == null ? "required field" : null,
                                  hint: "Select Experience",
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: [
                                    "Experience 1",
                                    "Experience 2",
                                    "Experience 3",
                                    'Experience 4'
                                  ],
                                  showClearButton: true,
                                  onChanged: print,
                                  clearButtonSplashRadius: 20,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                DropdownSearch<String>(
                                  validator: (v) =>
                                      v == null ? "required field" : null,
                                  hint: "Select Country",
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: [
                                    "County 1",
                                    "County 2",
                                    "County 3",
                                    'County 4'
                                  ],
                                  showClearButton: true,
                                  onChanged: print,
                                  clearButtonSplashRadius: 20,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(color: COLOR_GREY)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DateTimeField(
                                      format: DateFormat("dd-MM-yyyy"),
                                      decoration: InputDecoration(
                                        hintText: "\t DD-MM-YYYY",
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: COLOR_GREY,

                                      ),
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  style: TextStyle(
                                      color: COLOR_GREY, fontSize: 14),
                                  cursorColor: COLOR_GREY,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(Icons.school),
                                      hintStyle: TextStyle(
                                          color: COLOR_GREY, fontSize: 14),
                                      hintText: "Education",
                                      fillColor: Colors.white70,
                                      labelStyle: TextStyle(color: COLOR_GREY)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  style: TextStyle(
                                      color: COLOR_GREY, fontSize: 14),
                                  cursorColor: COLOR_GREY,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                      ),
                                      filled: true,
                                      prefixIcon: Icon(Icons.location_pin),
                                      hintStyle: TextStyle(
                                          color: COLOR_GREY, fontSize: 14),
                                      hintText: "Current Work Place",
                                      fillColor: Colors.white70,
                                      labelStyle: TextStyle(color: COLOR_GREY)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text("Fees", style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: COLOR_BLACK)),
                                SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: ToggleSwitch(
                                    minWidth: double.infinity,
                                    minHeight: 60,
                                    cornerRadius: 10.0,
                                    activeBgColors: [[Colors.purple[800]!], [Colors.purple[800]!]],
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.white70,
                                    inactiveFgColor: Colors.black54,
                                    initialLabelIndex: 1,
                                    totalSwitches: 2,
                                    labels: ['Sudan', 'Out of Sudan'],
                                    radiusStyle: true,
                                    onToggle: (index) {
                                      print('switched to: $index');
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color: Colors.grey[500]!),
                                    gradient: LinearGradient(
                                    colors: [COLOR_LIGHT_PURPLE,COLOR_LIGHT_BLUE],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight,
                                  ),),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 15,
                                        top: 14,
                                        bottom: 14),
                                    child: Text(
                                      "About Me",
                                      style: TextStyle(
                                          color: COLOR_WHITE,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Card(
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: TextField(
                                      maxLines: 6,
                                      decoration: InputDecoration.collapsed(hintText: "Write here"),
                                      style: TextStyle(
                                          color: COLOR_BLACK,
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
