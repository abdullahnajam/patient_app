import 'package:doctor_app/screens/LoginScreen.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Doctor',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.white,
          textTheme: TEXT_THEME_DEFAULT
      ),
      home: LoginScreen(),
    );
  }
}