import 'package:flutter/material.dart';
import 'package:flutter_application_1/Livechat.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/test.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/articleapi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/article.dart';
import 'package:flutter_application_1/people.dart';
//import 'home_widget.dart';

class CustomListView extends StatelessWidget {
  final List<Articles> articles;

//,this.image
  const CustomListView(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(articles[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Articles articles, BuildContext context) {
    final List<String> image = [];
    //List<Widget> result = articles.map((c) => Image.network(snapshot.data[index].imageUrl.toString())).toList();

    return ListTile(
        title: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(20.0),
            child: Column(
              //itemCount: articles.image.length,
              children: <Widget>[
                Image.network(
                  articles.image,
                  width: 300,
                  height: 200,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(
                        image: const AssetImage('images/mental.png'));
                  },
                ),

                /*child: Image.network(
                          articles.image,
                          width: 400,
                          height: 300,),
                  fit: BoxFit.fill,
                  */

                /*GridView.count(
                crossAxisCount: 3,
                children: List.generate(articles.image.length, (index) {
                 child: return Image.network(
                   articles.image[0],
                          width: 400,
                          height: 300,
                  );
                }),
              ),*/
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          articles.title,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(value: articles),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.

class DetailScreen extends StatefulWidget {
  final Articles value;

  const DetailScreen({Key? key, required this.value}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
          backgroundColor: const Color(0xFF1A237E),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Image.network(
                              widget.value.image,
                              width: 400,
                              height: 400,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Image(
                                  image: const AssetImage('images/mental.png'),
                                  width: 400,
                                  height: 400,
                                );
                              },
                            ),
                            /*new Image.network(
                  '${widget.value.image2}',width:400,height: 400,
                ),*/
                          ]))),
                  Padding(
                    child: Text(
                      widget.value.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Text(
                      widget.value.details,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    padding: const EdgeInsets.all(20.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlePage();
}

class _ArticlePage extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: const Color(0xFF1A237E),
                ),
                accountName: Text(
                  "Jack",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                accountEmail: const Text("Jack@gmail.com")),
            ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 30,
                ),
                title:
                    const Text("Home", style: const TextStyle(fontSize: 15.0)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyBottomNavigationBar(
                                email: '',
                              )));
                }),
            ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: const Text("Profile",
                    style: const TextStyle(fontSize: 15.0)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PeoplePage()));
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
      /*appBar:  AppBar(
          title:Text('Article'),
          backgroundColor: Color(0xFF1A237E),),*/
      body: Container(
        child: FutureBuilder<dynamic>(
          future: fetchArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Articles> articles = snapshot.data;
              return CustomListView(articles);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            //return  a circular progress indicator.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
