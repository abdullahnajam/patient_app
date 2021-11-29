import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:patient_app/Model/UserModel.dart';
import 'package:patient_app/screens/MenuScreen.dart';
import 'package:patient_app/screens/booking_history.dart';
import 'package:patient_app/screens/home_page.dart';
import 'package:patient_app/screens/search_result.dart';
import 'package:patient_app/utils/constants.dart';


class MainScreen extends StatefulWidget {
  UserModel model;

  MainScreen(this.model);

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
      'Search',
      style: optionStyle,
    ),
    Text(
      'Appointments',
      style: optionStyle,
    ),
    Text(
      'Menu',
      style: optionStyle,
    ),

  ];

  int _currentIndex=0;

  var tabs;

  @override
  void initState() {

    tabs= [
      HomePage(widget.model),
      SearchResult(widget.model),
      BookingHisttory(widget.model),
      MenuScreen(widget.model),
    ];
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
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.date_range_sharp,
                  text: 'Appointments',
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'Menu',
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