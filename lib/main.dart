import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/screens/SplashScreen.dart';
import 'package:patient_app/utils/constants.dart';
import 'package:patient_app/Auth/LoginScreen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'M5q72irNZ3ehKq6nDcZXSl0yU96tXKxqYEWfeYGq';
  final keyClientKey = '7ii0f1E4xodsQLzEhqltmXPgmv63guKhyr4cHFvZ';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/translation',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
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
        textTheme: TEXT_THEME_DEFAULT,
      ),
      home: SplashScreen(),
    );
  }
}


