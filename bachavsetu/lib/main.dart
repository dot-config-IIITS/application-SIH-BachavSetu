import 'package:bachavsetu/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'login/socket_manager.dart';
import 'init_page.dart';
import 'settings/settings_page.dart';
import 'login/form.dart';
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
      // home: InitPage(),
      home: const SettingsPage(),
    );
  }
}
