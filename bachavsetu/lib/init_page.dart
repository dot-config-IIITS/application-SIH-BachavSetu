import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home/home_page.dart';
import 'camera/camera_page.dart';
import 'settings/settings_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  // ignore: non_constant_identifier_names
  List Pages = [
    const HomePage(),
    const CameraPage(),
    const SettingsPage(),
  ];
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple.shade50,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          // print(index);
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.camera),
          Icon(Icons.settings),
        ],
      ),
      body: Pages[_selectedPage],
    );
  }
}
