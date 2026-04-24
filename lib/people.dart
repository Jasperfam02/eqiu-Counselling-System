import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const WebView(
        initialUrl: "https://kcproduct.000webhostapp.com/signin/retrieve.php",
        javascriptMode: JavascriptMode.unrestricted,
      ));
}
