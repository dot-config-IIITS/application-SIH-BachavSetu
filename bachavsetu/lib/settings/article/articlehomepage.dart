import 'package:flutter/material.dart';

import 'package:bachavsetu/settings/article/custom_list_tile.dart';
import 'package:bachavsetu/settings/article/article_model.dart';
import 'package:bachavsetu/settings/article/api_service.dart';

class ArticleHomePage extends StatefulWidget {
  @override
  _ArticleHomePageState createState() => _ArticleHomePageState();
}

class _ArticleHomePageState extends State<ArticleHomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Text("Error: ${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
