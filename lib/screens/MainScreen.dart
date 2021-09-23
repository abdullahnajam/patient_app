import 'package:doctor_app/screens/ProfileScreen.dart';
import 'package:doctor_app/screens/schedule.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/screens/MenuScreen.dart';
import 'package:doctor_app/screens/BookingHistoryScreen.dart';
import 'package:doctor_app/screens/HomeScreen.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'chats.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Appointment',
      style: optionStyle,
    ),
    Text(
      'Schedule',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Chat',
      style: optionStyle,
    ),

  ];

  int _currentIndex=0;

  final tabs= [
    HomePage(),
    BookingHisttory(),
    Schedule(),
    DoctorProfile(),
    UserChats(),
  ];

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

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 6,
              activeColor: COLOR_DARK_PURPLE,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: COLOR_FADED_PURPLE,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  // onPressed: () {
                  //   setState(() {
                  //     _currentIndex = 0;
                  //   });
                  // }
                ),
                GButton(
                  icon: Icons.date_range_sharp,
                  text: 'Appointment',
                ),
                GButton(
                  icon: Icons.lock_clock,
                  text: 'Schedule',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.5),
      //         spreadRadius: 1,
      //         blurRadius: 50,
      //       ),
      //     ],
      //   ),
      //   width: size.width,
      //   height: 80,
      //   child: Stack(
      //     children: [
      //       CustomPaint(
      //         size: Size(size.width,80),
      //         painter: AppCustomPainter(),
      //       ),
      //       Container(
      //         width: size.width,
      //         height: 80,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Center(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(flex:2, child: SizedBox(height: 10,)),
      //                   Expanded(
      //                     flex: 6,
      //                     child: IconButton(icon: Icon(Icons.home), color: COLOR_DARK_PURPLE, onPressed: (){
      //                       setState(() {
      //                         _currentIndex = 0;
      //                       });
      //                     }),
      //                   ),
      //                   Expanded(
      //                       flex: 6,
      //                       child:  Text("Home", style: TextStyle(color: COLOR_DARK_PURPLE ))
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Center(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(flex:2, child: SizedBox(height: 10,)),
      //                   Expanded(
      //                     flex: 6,
      //                     child: IconButton(icon: Icon(Icons.date_range_sharp), color: COLOR_DARK_PURPLE, onPressed: (){
      //                       setState(() {
      //                         _currentIndex = 1;
      //                       });
      //                     }),
      //                   ),
      //                   Expanded(
      //                       flex: 6,
      //                       child: Text("Appointment", style: TextStyle(color: COLOR_DARK_PURPLE , ))
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Center(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(flex:2, child: SizedBox(height: 10,)),
      //                   Expanded(
      //                     flex: 6,
      //                     child: IconButton(icon: Icon(Icons.lock_clock), color: COLOR_DARK_PURPLE, onPressed: (){
      //                       setState(() {
      //                         _currentIndex = 2;
      //                       });
      //                     }),
      //                   ),
      //                   Expanded(
      //                     flex: 6,
      //                     child: Text("Working hours", style: TextStyle(color: COLOR_DARK_PURPLE ))
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Center(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(flex:2, child: SizedBox(height: 10,)),
      //                   Expanded(
      //                     flex: 6,
      //                     child: IconButton(icon: Icon(Icons.person), color: COLOR_DARK_PURPLE, onPressed: (){
      //                       setState(() {
      //                         _currentIndex = 3;
      //                       });
      //                     }),
      //                   ),
      //                   Expanded(
      //                       flex: 6,
      //                       child: Text("Profile", style: TextStyle(color: COLOR_DARK_PURPLE , ))
      //                   ),
      //                 ],
      //               ),
      //             ),Center(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(flex:2, child: SizedBox(height: 10,)),
      //                   Expanded(
      //                     flex: 6,
      //                     child: IconButton(icon: Icon(Icons.chat), color: COLOR_DARK_PURPLE, onPressed: (){
      //                       setState(() {
      //                         _currentIndex = 4;
      //                       });
      //                     }),
      //                   ),
      //                   Expanded(
      //                       flex: 6,
      //                       child: Text("Chat", style: TextStyle(color: COLOR_DARK_PURPLE , ))
      //                   ),
      //                 ],
      //               ),
      //             ),
      //
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class AppCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = COLOR_GREY.withOpacity(0.1)..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.50, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}