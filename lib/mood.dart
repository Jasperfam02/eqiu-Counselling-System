import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class emotionalPage extends StatefulWidget {
  const emotionalPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _emotionalState();
}

class _emotionalState extends State<emotionalPage> {
  // This widget is the root of your application.
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
              title: const Text("Add Emotional status"),
              backgroundColor: const Color(0xFF1A237E)),
          body: const WebView(
            initialUrl:
                "https://kcproduct.000webhostapp.com/emotionalstatus/mood.php",
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
