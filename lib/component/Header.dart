import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: const Text(
              "Login",
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
