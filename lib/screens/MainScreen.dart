import 'package:flutter/material.dart';
import 'package:patient_app/screens/MenuScreen.dart';
import 'package:patient_app/screens/booking_history.dart';
import 'package:patient_app/screens/home_page.dart';
import 'package:patient_app/screens/search_result.dart';
import 'package:patient_app/utils/constants.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex=0;

  final tabs= [
    HomePage(),
    SearchResult(),
    BookingHisttory(),
    MenuScreen(),
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
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 50,
            ),
          ],
        ),
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width,80),
              painter: AppCustomPainter(),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex:2, child: SizedBox(height: 10,)),
                        Expanded(
                          flex: 6,
                          child: IconButton(icon: Icon(Icons.home), color: COLOR_DARK_PURPLE, onPressed: (){
                            setState(() {
                              _currentIndex = 0;
                            });
                          }),
                        ),
                        Expanded(
                            flex: 6,
                            child:  Text("Home", style: TextStyle(color: COLOR_DARK_PURPLE ))
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex:2, child: SizedBox(height: 10,)),
                        Expanded(
                          flex: 6,
                          child: IconButton(icon: Icon(Icons.search), color: COLOR_DARK_PURPLE, onPressed: (){
                            setState(() {
                              _currentIndex = 1;
                            });
                          }),
                        ),
                        Expanded(
                            flex: 6,
                            child: Text("Search", style: TextStyle(color: COLOR_DARK_PURPLE , ))
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex:2, child: SizedBox(height: 10,)),
                        Expanded(
                          flex: 6,
                          child: IconButton(icon: Icon(Icons.date_range_sharp), color: COLOR_DARK_PURPLE, onPressed: (){
                            setState(() {
                              _currentIndex = 2;
                            });
                          }),
                        ),
                        Expanded(
                            flex: 6,
                            child: Text("Appointments", style: TextStyle(color: COLOR_DARK_PURPLE , ))
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex:2, child: SizedBox(height: 10,)),
                        Expanded(
                          flex: 6,
                          child: IconButton(icon: Icon(Icons.menu), color: COLOR_DARK_PURPLE, onPressed: (){
                            setState(() {
                              _currentIndex = 3;
                            });
                          }),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text("Menu", style: TextStyle(color: COLOR_DARK_PURPLE ))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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