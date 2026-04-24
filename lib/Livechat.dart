import 'package:flutter/material.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_application_1/home.dart';





class LivechatPage extends StatefulWidget{
  const LivechatPage({Key? key}) : super(key: key);

@override 
State<StatefulWidget> createState() => _LivechatState();



}

class _LivechatState extends State<LivechatPage>{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return const Scaffold(

   
    /*drawer: new Drawer(
     child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
        color: Color(0xFF1A237E),
            ),
          accountName: new Text("Jack",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),),
          accountEmail: new Text("Jack@gmail.com"),
           
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
              title: Text("Live chat"),
              backgroundColor: Color(0xFF1A237E)),*/
      body: const WebView(
        initialUrl:"https://kcproduct.000webhostapp.com/Login/library/livechatnew.html" ,
        javascriptMode: JavascriptMode.unrestricted,
        
 
    )

    );



  
}

  canLaunch(String url) async{
if (await canLaunch(url)) {
  (url);
} else {
  throw 'Could not launch $url';
}
  }
}

_launchURL(String url) async{
  
  if (await canLaunch(url)) {
  (url);
} else {
  throw 'Could not launch $url';
}
  }

