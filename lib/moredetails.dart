import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoreState();
}

class _MoreState extends State<MorePage> {
  // This widget is the root of your application.
  final _key = UniqueKey();
  _MoreState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          key: _key,
          userAgent: "random",
          initialUrl:
              "https://www.tacklit.com/how/decision-making/psychometrics/dass-21",
          //initialUrl:"https://kcproduct.000webhostapp.com/appointment/schdule.html" ,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
