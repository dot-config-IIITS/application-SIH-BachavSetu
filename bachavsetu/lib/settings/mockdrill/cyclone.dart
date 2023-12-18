import 'package:flutter/material.dart';

class Cyclone extends StatelessWidget {
  const Cyclone({Key? key});

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
              'Cyclone Alert In Your Area!',
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
        title: const Text('Cyclone'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Evacuation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/cyclone/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Follow evacuation orders issued by authorities.',
              ),
              const Text(
                '2. Use designated evacuation routes and avoid shortcuts.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Preparation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/cyclone/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Board up windows with plywood.',
              ),
              const Text(
                '2. Secure outdoor objects or bring them inside.',
              ),
              const Text(
                '3. Stock up on non-perishable food, water, medications, and essential supplies.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/cyclone/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay informed about the hurricane\'s progress through weather updates.',
              ),
              const Text(
                '2. Have a battery-powered radio for continuous information.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
