import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  // This widget is the root of your application.
  final _key = UniqueKey();
  _SignupState();
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
          title: const Text("Sign up"),
          backgroundColor: const Color(0xFF1A237E),
        ),
        body: WebView(
          key: _key,
          userAgent: "random",
          initialUrl: "https://kcproduct.000webhostapp.com/signup/signup.php",
          //initialUrl:"https://kcproduct.000webhostapp.com/appointment/schdule.html" ,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
