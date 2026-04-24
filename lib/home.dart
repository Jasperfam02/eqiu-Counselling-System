import 'package:flutter/material.dart';
import 'package:flutter_application_1/Livechat.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/mood.dart';
import 'package:flutter_application_1/articlepage.dart';
import 'package:flutter_application_1/appointment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/component/InputField.dart';

//import 'home_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

var indexClick = 0;

class _HomeState extends State<HomePage> {
  final Uri _url = Uri.parse(
      "https://api.whatsapp.com/send?phone=60103949772&text=Hello%2C%20I%20feel%20stress%2C%20can%20I%20talk%20to%20someone%3F");
  int selectedIndex = 0;
  final int _currentIndex = 0;
  final _children = [
    HomePage(),
    LivechatPage(),
    AppointPage(),
    ArticlePage(),
  ];

  void onTappedBar(int index) {
    selectedIndex = index;
    setState(() {});
  }

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

//final String email;
//HomePage({required this.email});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          "Welcome back!",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        /*leading:  Icon(
        Icons.menu,
        color: Colors.white,
      ),*/
        /*actions: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
        ),
       /* GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child:Image.asset("images/profile.png")
          ),
        ),
      
      */
      ],*/
      ),

      /*drawer: new Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: new Text("Jack",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
          accountEmail: new Text("Jack@gmail.com")
          ),
        ListTile(
        leading:Icon(Icons.person,
                      size: 30,
                      ),
        title:Text("Profile",style:TextStyle(fontSize: 15.0)),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PeoplePage()));
        }
         ),
        ListTile(
        leading:Icon(Icons.history,size: 30),
        title:Text("History",style:TextStyle(fontSize: 15.0)),
         ),
        ListTile(
        leading:Icon(Icons.logout,size: 30),
        title:Text("Log out",style:TextStyle(fontSize: 15.0)),
         )
      ],
    ),
  ),
*/
      resizeToAvoidBottomInset: false,
      /* body: _children[_currentIndex],*/
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
              topRight: const Radius.circular(20),
              topLeft: const Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*Container(
          margin: EdgeInsets.only(top:10, left:30),
          child: Text(
            "Hello, Welcome",
            style: TextStyle(
              color:Color(0xFF000000),
              fontSize: 30,
              fontWeight:FontWeight.bold,
              fontFamily:'Noto Sans, sans-serif',
            ),
          ),
        ),*/

              Container(
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                          color: const Color(0xDD000000),
                          offset: const Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: 0),
                    ]),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const TextField(
                          maxLines: 1,
                          autofocus: false,
                          style: const TextStyle(
                            color: const Color(0xff107163),
                            fontSize: 20,
                          ),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Search..."),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF1A237E),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, left: 30),
                width: size.width,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      child: const Text(
                        "Emotional check",
                        style: const TextStyle(
                          color: const Color(0xff363636),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial, sans-serif",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                margin: const EdgeInsets.only(top: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    emotionalPage()));
                      },
                      //demoCategories("images/dass-21.jpg","Live Chat"),
                      child: demoCategories("images/feeling.jpg"),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 209, 228),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: const Text(
                        '" The Secret of being happy is accepting where you are in life and making the most out of everyday "',
                        // ignore: prefer_const_constructors
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          color: const Color.fromARGB(255, 66, 66, 66),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 30),
                width: size.width,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      child: const Text(
                        "Depression, Anxiety and Stress Scale(Dass-21)",
                        style: const TextStyle(
                          color: const Color(0xff363636),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial, sans-serif",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                margin: const EdgeInsets.only(top: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => testPage()));
                      },
                      //demoCategories("images/dass-21.jpg","Live Chat"),
                      child: demoCategories("images/dass-21.jpg"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Widget demoCategories(String image, String name){
  Widget demoCategories(String image) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 20),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 10,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover),
          ),

          /*Container(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Arial, sans-serif",
                fontWeight: FontWeight.bold,
                
            ),
            ),
        ),
      */
        ],
      ),
    );
  }
}
