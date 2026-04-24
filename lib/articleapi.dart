import'package:flutter_application_1/article.dart';
import 'package:http/http.dart' as http;


Future<List<Articles>> fetchArticles() async{
  //String url="https://kcproduct.000webhostapp.com/Login/article/fetchdata.php";
  final response= await http.get(Uri.parse('https://kcproduct.000webhostapp.com/Login/article/fetchdata.php'));
  
  return articlesFromJson(response.body).toList();


}

