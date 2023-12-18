import 'dart:convert';
import 'package:http/http.dart';

import 'package:bachavsetu/settings/article/api_key.dart';
import 'package:bachavsetu/settings/article/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=disaster-management&apiKey=$NEWS_API_KEY";

  Future<List<Article>> getArticle() async {
    try {
      Response res = await get(Uri.parse(endPointUrl));

      // print(res.statusCode);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        // The following line is causing the problem.
        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        print("run4");
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
