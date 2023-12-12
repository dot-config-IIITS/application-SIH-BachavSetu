import 'dart:convert';

import 'api_key.dart';
import 'article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=$NEWS_API_KEY";

  Future<List<Article>> getArticle() async {
    try {
      Response res = await get(Uri.parse(endPointUrl));

      // print(res.statusCode);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        List<dynamic> body = json['articles'];

        // START FRIXING FROM HERE
        print(body);

        if (body == null) {
          print("BODY IS NULLLLLLLLLLLLLLLLLLLLLLLL");
        }
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        print(articles);
        return articles;
      } else {
        throw Exception(
            "Failed to get articles. Status code: ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Error getting articles: $e");
    }
  }
}
