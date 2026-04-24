import 'package:flutter/material.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/moredetails.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class testPage extends StatefulWidget {
  const testPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _testState();
}

class _testState extends State<testPage> {
  // This widget is the root of your application.
  final _key = UniqueKey();
  _testState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text("Dass-21"),
            backgroundColor: const Color(0xFF1A237E),
            actions: [
              GestureDetector(
                child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 15),
                    child: RichText(
                        text: const TextSpan(children: const [
                      WidgetSpan(
                        child: const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      TextSpan(
                          text: " More",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ]))),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MorePage()));
                },
              )
            ]),

        /* GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child:Image.asset("images/profile.png")
          ),
        ),
      
      */

        body: WebView(
          key: _key,
          userAgent: "random",
          initialUrl: "https://kcproduct.000webhostapp.com/Dass-21/index.php",
          //initialUrl:"https://kcproduct.000webhostapp.com/appointment/schdule.html" ,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
