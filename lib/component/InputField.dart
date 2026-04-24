import 'dart:convert';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:http/http.dart' as http;

class InputField extends StatelessWidget {
  final user = TextEditingController();
  final pass = TextEditingController();

  InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void login() async {
      String email = user.text;
      // var url= 'http:// 192.168.1.7/login_php/login.php';
      var response = await http.post(
          Uri.parse('https://kcproduct.000webhostapp.com/signin/login.php'),
          body: {
            "username": email,
            "password": pass.text,
          });
      var data = jsonDecode(response.body);
      if (data == "Success") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Login Successful'),
            content: const Text('Welcome'),
            actions: <Widget>[
              TextButton(
                // ignore: unnecessary_new
                onPressed: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new MyBottomNavigationBar(email: user.text))),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        /*Fluttertoast.showToast(
      msg: "Login Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
      );*/
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Wrong password or username'),
            content: const Text('Try Again!!!'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );

        /*Fluttertoast.showToast(
      msg: "Wrong password or username",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 22, 2, 0),
      textColor: Colors.white,
      fontSize: 16.0
     );*/
      }
    }

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border:
                  const Border(bottom: const BorderSide(color: Colors.grey))),
          child: TextField(
            controller: user,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border:
                  const Border(bottom: const BorderSide(color: Colors.grey))),
          child: TextField(
            controller: pass,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                border: InputBorder.none),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 30.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1A237E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  //onPressed:() => Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PeoplePage())),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    "Login",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
        Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: const Text(
              "Haven't register account? Register at here",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )),
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF1A237E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage())),
                  child: const Text(
                    "Sign Up",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
      ]),
    );
  }
}
