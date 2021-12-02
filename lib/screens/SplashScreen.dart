import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/Navigator/BottomNav.dart';
import 'package:patient_app/screens/onBoardingScreen.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final splashDelay = 5;


/*  @override
  void initState() {
    super.initState();
    _loadWidget();
  }
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }*/

  void navigationPage() async{
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen()));
    }
    else{
      QueryBuilder<ParseObject> queryUsers =
      QueryBuilder<ParseObject>(ParseObject('userData'))
        ..whereEqualTo('userObjectId', currentUser.objectId);
      final ParseResponse parseResponse = await queryUsers.query();

      if (parseResponse.success && parseResponse.results != null) {
        final object = (parseResponse.results!.first) as ParseObject;
        UserModel model = UserModel(object.get<String>('objectId').toString(),object.get<String>('fullName').toString(),object.get<String>('email').toString(),object.get<String>('phoneNo').toString(),object.get<String>('gender').toString() ,object.get<String>('type').toString(),object.get<String>('userObjectId').toString());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen(model)));


      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_logo.png"),
                  fit: BoxFit.cover)
          ),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 350),
              InkWell(
                onTap: navigationPage,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [COLOR_LIGHT_PURPLE, COLOR_LIGHT_BLUE],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                ),
              ),
            ],
          )),
      ),
    );
  }
}

