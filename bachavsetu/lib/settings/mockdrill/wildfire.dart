import 'package:flutter/material.dart';

class WildFire extends StatelessWidget {
  const WildFire({Key? key});

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
              'Wildfire Alert In Your Area!',
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
        title: const Text('Wildfire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Evacuation Planning',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/wildfire/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Develop and practice an evacuation plan.',
              ),
              const Text(
                '2. Be aware of multiple evacuation routes.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Defensible Space',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/wildfire/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Create a defensible space around your property by clearing vegetation.',
              ),
              const Text(
                '2. Remove dead leaves, branches, and flammable materials.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Emergency Kit',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/wildfire/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Pack an emergency kit with clothing, water, and essential items.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
