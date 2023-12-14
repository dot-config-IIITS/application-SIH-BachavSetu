import 'package:flutter/material.dart';
import 'login/socket_manager.dart';
import 'init_page.dart';
import 'login/welcome.dart';
import 'article/articlehomepage.dart';
import 'settings/mock_drill.dart';
import '/settings/feedback.dart';
import 'package:bachavsetu/login/form.dart';

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
      // home: InitPage(),
      // home: MockDrill(),
      // home: FeedbackForm(),
      home: FormPage(),
    );
  }
}
