import 'package:bachavsetu/settings/article/source_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "null",
      title: json['title'] ?? "null",
      description: json['description'] ?? "null",
      url: json['url'] ?? "null",
      urlToImage: json['urlToImage'] ?? "null",
      publishedAt: json['publishedAt'] ?? "null",
      content: json['content'] ?? "null",
    );
  }
}
