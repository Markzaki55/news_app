import 'dart:convert';

import 'package:get/get.dart';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Articles({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  late List<Article> articles ;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from((json["articles"] as List<dynamic>).map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    //required this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  //late DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
  print('json: $json');
  final article = Article(
    source: json["source"] == null ? null : Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    //publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );
  print('article: $article');
  return article;
}

  get publishedAt => null;

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
   // "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}
class Source {
  Source({
    this.id,
    required this.name,
  });

  String? id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}