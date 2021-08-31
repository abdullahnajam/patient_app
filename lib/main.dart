import 'package:flutter/material.dart';
import 'package:patient_app/screens/CategoryScreen.dart';
import 'package:patient_app/screens/ForgotPasswordScreen.dart';
import 'package:patient_app/screens/ForgotPasswordSentScreen.dart';
import 'package:patient_app/screens/MainScreen.dart';
import 'package:patient_app/screens/MenuScreen.dart';
import 'package:patient_app/screens/NotificationScreen.dart';
import 'package:patient_app/screens/PrivacyScreen.dart';
import 'package:patient_app/screens/RegisterScreen.dart';
import 'package:patient_app/screens/ReportScreen.dart';
import 'package:patient_app/screens/SupportScreen.dart';
import 'package:patient_app/screens/WalletScreen.dart';
import 'dart:ui';
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
