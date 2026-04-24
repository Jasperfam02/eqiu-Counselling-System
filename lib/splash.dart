import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Loginpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 300.0),
                  child: const Center(
                      child: const Image(
                          image: const AssetImage('images/splash.png')))),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: const Center(
                  child: const CircularProgressIndicator(),
                ),
              )
            ]));
  }
}
