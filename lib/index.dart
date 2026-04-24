import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Livechat.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/mood.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/articlepage.dart';
import 'package:flutter_application_1/appointment.dart';
import 'package:flutter_application_1/home.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final String email;
  const MyBottomNavigationBar({Key? key, required this.email})
      : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  String _title = "eQIU";
  final List<Widget> _children = [
    //HomePage(email: '',),
    HomePage(),
    LivechatPage(),
    AppointPage(),
    ArticlePage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = widget.email;
          }
          break;
        case 1:
          {
            _title = 'Live chat';
          }
          break;
        case 2:
          {
            _title = 'Appointment';
          }
          break;
        case 3:
          {
            _title = 'Article';
          }
          break;
      }
    });
  }

  @override
  initState() {
    _title = widget.email;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          _title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.phone_in_talk_sharp,
                color: Colors.white,
              ),
            ),
            onTap: () {
              //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PeoplePage()));
              openWhatsapp();
            },
          ),
          /* GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child:Image.asset("images/profile.png")
          ),
        ),
      
      */
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(
                  widget.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                accountEmail: const Text('')),
            ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: const Text("Profile",
                    style: const TextStyle(fontSize: 15.0)),
                onTap: () {
                  // Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PeoplePage()));
                }),
            const ListTile(
              leading: const Icon(Icons.history, size: 30),
              title:
                  const Text("History", style: const TextStyle(fontSize: 15.0)),
            ),
            const ListTile(
              leading: const Icon(Icons.logout, size: 30),
              title:
                  const Text("Log out", style: const TextStyle(fontSize: 15.0)),
            )
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: const Radius.circular(50),
              topLeft: const Radius.circular(50)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFF1A237E),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Livechat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Appointment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: 'Article'),
          ],
          //currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  openWhatsapp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+60103949772',
      text: "Hello! Miss Natasha",
    );
    await launch('$link');

    /* var whatsapp="+60103949772";
    final Uri _whatsappURL_android=Uri.parse("whatsapp://send?phone="+whatsapp);

  if (await canLaunchUrl(_whatsappURL_android)){
    await launchUrl(_whatsappURL_android);
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: new Text("Whatsapp no installed"))
    );
  }
  }*/
    /*var whatsapp="+60103949772";
    final Uri _whatsappURL_android=Uri.parse("whatsapp://send?phone="+whatsapp);
    final Uri __whatsappURL_ios=Uri.parse("https://wa.me/$whatsapp?");
  
  /*if(Platform.isIOS){
      if (await canLaunchUrl(__whatsappURL_ios)){
     await launchUrl(__whatsappURL_ios);
  }
    else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: new Text("Whatsapp no installed"))
    );
  }

  }
  
 else{ */
   if (await canLaunchUrl(_whatsappURL_android)){
    await launchUrl(_whatsappURL_android);
  }


  else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: new Text("Whatsapp no installed"))
    );
  }
  }
}*/
  }
}
