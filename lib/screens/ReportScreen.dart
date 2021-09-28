import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:patient_app/utils/constants.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}
enum issue { change, report, other }
class _ReportScreenState extends State<ReportScreen> {
  Color _backgroundColor = COLOR_WHITE;
  String _verticalGroupValue = "Pending";
  issue _issue = issue.change;

  List<String> _status = ["Change profile details", "Report a Therapist", "other issues"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          child: ListView(
            padding: EdgeInsets.fromLTRB(12, 52, 22, 12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    child: Icon(Icons.arrow_back_ios_rounded,
                        color: COLOR_DARK_BLUE),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.white70, // <-- Button color
                    ),
                  ),
                  Text("Report & Flag",
                      style: TextStyle(
                        fontSize: 18,
                        color: COLOR_BLACK,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 45,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Report a problem",
                            style: TextStyle(
                                color: COLOR_BLACK,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                      Card(
                        color: COLOR_GREY.withOpacity(0.1),
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              maxLines: 6,
                              decoration: InputDecoration.collapsed(hintText: "Write what went wrong"),
                              style: TextStyle(
                                color: COLOR_BLACK,
                                fontSize: 14
                              ),
                            ),
                          ),
                      ),
                          Center(
                            child: Text(
                              "We may notify you when we have updates on your feedback",
                              style: TextStyle(
                                  color: COLOR_BLACK,
                                  fontSize: 10),
                            ),
                    )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Basic Issue",
                    style: TextStyle(
                        color: COLOR_BLACK,
                        fontSize: 16),
                  ),


                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:Column(
                        children: [
                          Row(
                            children: [
                              new Radio(
                                value: issue.change,
                                groupValue: _issue,
                                onChanged: (issue? value) {
                                  setState(() {
                                    _issue = value!;
                                  });
                                },
                              ),
                              new Text(
                                _status[0],
                                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              new Radio(
                                value: issue.report,
                                groupValue: _issue,
                                onChanged: (issue? value) {
                                  setState(() {
                                    _issue = value!;
                                  });
                                },
                              ),
                              new Text(
                                _status[1],
                                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              new Radio(
                                value: issue.other,
                                groupValue: _issue,
                                onChanged: (issue? value) {
                                  setState(() {
                                    _issue = value!;
                                  });
                                },
                              ),
                              new Text(
                                _status[2],
                                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [COLOR_DARK_BLUE, COLOR_LIGHT_PURPLE],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints: BoxConstraints( minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Send",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
