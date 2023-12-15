import 'package:bachavsetu/settings/faq/expansion.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ExpansionPanelListExample(),
      ),
    );
  }
}
