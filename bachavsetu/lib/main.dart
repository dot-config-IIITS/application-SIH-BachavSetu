import 'package:bachavsetu/camera/camera_page.dart';
import 'package:bachavsetu/login/welcome.dart';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:bachavsetu/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/socket_manager.dart';
import 'init_page.dart';
import 'settings/settings_page.dart';
import 'login/form.dart';
import 'settings/article/articlehomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserDataModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BachavSetu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'GE Inspira'),
      home: Welcome(),
      // home: ArticleHomePage(),
      // home: InitPage(),
      // home: MockDrill(),
      // home: SettingsPage(),
    );
  }
}
