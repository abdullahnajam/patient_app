import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/utils/constants.dart';



class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
    String dropdownValue = 'This Week';

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
                  Text("Wallet",
                      style: TextStyle(
                        fontSize: 18,
                        color: COLOR_BLACK,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 55,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      //width: MediaQuery.of(context).size.width*0.9,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*0.05,
                        right: MediaQuery.of(context).size.width*0.05,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff3738a2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Balance",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18),),
                                Text("\$1200",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),

                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.12,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Points",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18),),
                                Text("1920",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width*0.6,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*0.2,
                        right: MediaQuery.of(context).size.width*0.2,
                        top: MediaQuery.of(context).size.height*0.165,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffa342d7),
                            Color(0xff271f59),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Text("\$  Recharge",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transactions", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: COLOR_BLACK
                  )),
                  Container(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: COLOR_GREY),
                      iconSize: 18,
                      elevation: 10,
                      style: const TextStyle(color: COLOR_GREY),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['This Week', 'Last Week', 'Last Month', 'Last Year']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  )

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