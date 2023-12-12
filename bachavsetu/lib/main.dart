import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'login/socket_manager.dart';
=======

import 'init_page.dart';
>>>>>>> 67ff59645c91341739ee8a3fffa1bc0e7707a73d
import 'login/welcome.dart';
import 'article/articlehomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BachavSetu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'GE Inspira'),
      // home: Welcome(),
      // home: ArticleHomePage(),
      home: InitPage(),
    );
  }
}
