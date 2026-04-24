// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

List<Articles> articlesFromJson(String str) =>
    List<Articles>.from(json.decode(str).map((x) => Articles.fromJson(x)));

//String articlesToJson(List<Articles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Articles {
  Articles({
    required this.articledate,
    required this.title,
    required this.image,
    required this.details,
  });

  DateTime articledate;
  String title;
  String image;
  String details;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      articledate: DateTime.parse(json["articledate"]),
      title: json["title"],
      image: "https://kcproduct.000webhostapp.com/Login/article/images/" +
          json["image"],
      details: json["details"],
    );
  }
}

/* factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        articledate: DateTime.parse(json["articledate"]),
        title: json["title"],
        image: "https://kcproduct.000webhostapp.com/Login/article/images/"+json["image"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "articledate": "${articledate.year.toString().padLeft(4, '0')}-${articledate.month.toString().padLeft(2, '0')}-${articledate.day.toString().padLeft(2, '0')}",
        "title": title,
        "image": image,
        "details": details,
    };
}*/
