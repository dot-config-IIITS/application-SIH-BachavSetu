import 'package:flutter/material.dart';
import 'login/welcome.dart';
import 'article/articlehomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BachavSetu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'GE Inspira'),
      // home: Welcome(),
      home: ArticleHomePage(),
    );
  }
}
