import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/utils/constants.dart';



class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Color _backgroundColor = COLOR_WHITE;

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
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(22, 52, 22, 24),
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
                  Text("Notifications",
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
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/notification_note.png', height: 70),
                          ),
                          Expanded(
                              flex: 8,
                              child: Text("Dr.Melvin send you a note for daily health", style:
                              TextStyle(
                                  color: COLOR_GREY.withOpacity(0.5),
                                  fontSize: 14
                              ),)
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/notification_booking.png', height: 70),
                          ),
                          Expanded(
                              flex: 8,
                              child: Text("Dr.Melvin accept your book please check your calender", style:
                              TextStyle(
                                  color: COLOR_GREY.withOpacity(0.5),
                                  fontSize: 14
                              ),)
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/wallet_image.png', height: 70),
                          ),
                          Expanded(
                              flex: 8,
                              child: Text("Your top up balance \$1000 has been success", style:
                              TextStyle(
                                  color: COLOR_GREY.withOpacity(0.5),
                                  fontSize: 14
                              ),)
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset('assets/images/wallet_image.png', height: 70),
                          ),
                          Expanded(
                              flex: 8,
                              child: Text("Your top up balance \$1000 has been success", style:
                              TextStyle(
                                  color: COLOR_GREY.withOpacity(0.5),
                                  fontSize: 14
                              ),)
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )


            ],
          ),
        )
    );
  }
}