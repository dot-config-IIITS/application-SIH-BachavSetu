import 'package:flutter/material.dart';

class Pandemic extends StatelessWidget {
  const Pandemic({Key? key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning),
                SizedBox(width: 8),
                Text('Alert'),
                SizedBox(width: 8),
                Icon(Icons.warning),
              ],
            ),
            content: const Text(
              'Pandemic Alert In Your Area!',
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ensure Your Safety'),
                ),
              ),
            ],
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pandemic'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hygiene Practices',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/settingsAssets/avatar.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Follow public health guidelines, including regular handwashing.',
              ),
              const Text(
                '2. Wear masks and practice social distancing.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Stocking Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/settingsAssets/avatar.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stock up on essential supplies, medications, and personal protective equipment.',
              ),
              const Text(
                '2. Have a plan for obtaining medications if needed.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/settingsAssets/avatar.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay informed about the latest updates from health authorities.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
