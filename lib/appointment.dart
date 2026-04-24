import 'package:flutter/material.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';

class AppointPage extends StatefulWidget {
  const AppointPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppointPageState();
}

class _AppointPageState extends State<AppointPage> {
  // This widget is the root of your application.
  final _key = UniqueKey();
  _AppointPageState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* drawer: new Drawer(
     child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
           color:Color(0xFF1A237E),
           ),
          accountName: new Text("Jack",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
          accountEmail: new Text("Jack@gmail.com")
          ),
        ListTile(
        leading:Icon(Icons.home,
                      size: 30,
                      ),
        title:Text("Home",style:TextStyle(fontSize: 15.0)),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>new MyBottomNavigationBar(email: '',)));
        }
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
        ),*/
        /*appBar: AppBar(
        title: Text("Make Appointment"),
        backgroundColor:Color(0xFF1A237E),
        ),*/
        body: WebView(
      key: _key,
      userAgent: "random",
      //initialUrl:"https://kcproduct.000webhostapp.com/Dass21/index.html" ,
      initialUrl:
          "   https://kcproduct.000webhostapp.com/appointment/schedule.php",

      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
