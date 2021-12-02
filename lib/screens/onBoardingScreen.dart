import 'package:patient_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Auth/LoginScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }
  void nextPage(){
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(),

          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      children:  <Widget>[

                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.38,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*0.05,
                                right: MediaQuery.of(context).size.width*0.05,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/1.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("Let's consult with best doctors",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 18),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("You can choose best doctors for you and your family",style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w300,fontSize: 15),),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.38,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*0.05,
                                right: MediaQuery.of(context).size.width*0.05,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/2.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("Let's consult with best doctors",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 18),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("You can choose best doctors for you and your family",style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w300,fontSize: 15),),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.38,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*0.05,
                                right: MediaQuery.of(context).size.width*0.05,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/3.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("Let's consult with best doctor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 18),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text("You can choose best doctors for you and your family",style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w300,fontSize: 15),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        type: WormType.thin,
                        // strokeWidth: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    if(controller.page!.toInt()==2){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                    }
                    else
                      nextPage();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                    ),
                    alignment: Alignment.center,
                    child: Text("Next",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
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
