import 'package:flutter/material.dart';

class Flood extends StatelessWidget {
  const Flood({Key? key});

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
              'Flood Alert In Your Area!',
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
        title: const Text('Flood'),
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
                  'assets/mock/flood/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Move to higher ground if in a flood-prone area.',
              ),
              const Text(
                '2. Follow evacuation orders promptly.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Utilities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/flood/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Turn off utilities if instructed to do so to prevent electrical hazards.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Safety Measures',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/flood/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Avoid walking or driving through flooded areas.',
              ),
              const Text(
                '2. Have an emergency kit containing important documents, medications, and basic supplies.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/flood/i4.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay informed about the flood\'s progress through weather updates.',
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
