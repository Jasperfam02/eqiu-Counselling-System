import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
//import 'package:flutter_application_1/component/Button.dart';
import 'package:flutter_application_1/component/Header.dart';
import 'package:flutter_application_1/component/InputWrapper.dart';
import 'package:flutter_application_1/home.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  /*final Widget child;
  const Login({ Key? key, @required this.child,}) : super(key: key);
*/
  @override
  Widget build(BuildContext context) {
    //resizeToAvoidBottomPadding: false,
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient:
                const LinearGradient(begin: Alignment.topCenter, colors: const [
              Color(0xFF1A237E),
              Color(0xFF1A237E),
              Color(0xFF1A237E),
            ]),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Header(),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 60.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(60),
                      topRight: const Radius.circular(60),
                      bottomRight: const Radius.circular(0),
                      bottomLeft: const Radius.circular(0),
                    )),
                child: InputWrapper(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
