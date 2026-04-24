import 'package:flutter/material.dart';
import 'package:flutter_application_1/articlepage.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash.dart';
//import 'package:flutter_application_1/login.dart';
//import 'package:flutter_application_1/login.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1A237E),
      ),
      // ignore: prefer_const_constructors
      home: HomePage(),

  
    );
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A237E),
      ),
      //home:Loginpage(),
      home: Splash(),

      // home:
    );
  }
}
