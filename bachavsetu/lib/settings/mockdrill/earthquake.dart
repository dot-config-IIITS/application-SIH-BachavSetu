import 'package:flutter/material.dart';

class Earthquake extends StatelessWidget {
  const Earthquake({Key? key});

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
              'Earthquake Alert In Your Area!',
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
        title: const Text('Earthquake'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Drop, Cover, and Hold On',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/earthquake/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Drop to the ground to prevent being knocked over.',
              ),
              const Text(
                '2. Take cover under a sturdy piece of furniture, such as a table or desk.',
              ),
              const Text(
                '3. Hold on to the furniture to protect yourself from falling objects.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Indoor Safety',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/earthquake/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay indoors during the quake.',
              ),
              const Text(
                '2. Avoid doorways and windows, as they can pose risks.',
              ),
              const Text(
                '3. If in bed, stay there and cover your head and neck with a pillow.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Outdoor Safety',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/earthquake/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Move to an open area away from buildings, streetlights, and utility wires.',
              ),
              const Text(
                '2. Be cautious of falling debris.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Aftershocks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/earthquake/i4.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Be prepared for aftershocks, which may follow the initial quake.',
              ),
              const Text(
                '2. Stay informed through a battery-powered radio for updates.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
