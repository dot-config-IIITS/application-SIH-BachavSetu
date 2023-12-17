import 'package:flutter/material.dart';

import 'package:bachavsetu/settings/faq/expansion.dart';

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
