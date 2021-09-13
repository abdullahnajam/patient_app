import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var margin=MediaQuery.of(context).size.width*0.05;
    return Drawer(

      child: Container(
        color: blue,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(margin),
                      height:60,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage("assets/placeholder/doctor.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Expanded(
                      child: Text("Ayman Humida",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home,color: Colors.white,),
                      title: Text("Home",style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      leading: Icon(Icons.person,color: Colors.white,),
                      title: Text("My Account",style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      leading: Icon(Icons.send_outlined,color: Colors.white,),
                      title: Text("Appointment Requests",style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications,color: Colors.white,),
                      title: Text("Notifications",style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      leading: Icon(Icons.chat,color: Colors.white,),
                      title: Text("Chats",style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings,color: Colors.white,),
                      title: Text("Settings",style: TextStyle(color: Colors.white),),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text("Logout",style: TextStyle(color: Colors.white),),
              ),
            ),
            /*Align(
            alignment: Alignment.center,
            child: Container(

            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(

            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(

            ),
          ),*/
          ],
        ),
      )
    );
  }
}
