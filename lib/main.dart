import 'package:flutter/material.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:patient_app/screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.white,
        textTheme: TEXT_THEME_DEFAULT
      ),
      home: LoginScreen(),
    );
  }
}
