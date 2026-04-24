import 'package:flutter/material.dart';

//import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),

          /* Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.grey),
          ),*/
          // SizedBox(height: 40,),
        ],
      ),
    );
  }
}
