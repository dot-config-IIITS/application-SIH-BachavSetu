import 'package:flutter/material.dart';

class KitchenFire extends StatelessWidget {
  const KitchenFire({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen Fire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Immediate Response',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                  'https://placekitten.com/200/150', // Replace with actual image URL
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Turn off the heat source if safe to do so.',
              ),
              const Text(
                '2. Smother the fire with a lid or use a fire extinguisher.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Evacuation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. If the fire is spreading, evacuate everyone from the house.',
              ),
              const Text(
                '2. Close doors behind you to slow the fire\'s progress.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Alerting Others',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Call emergency services immediately.',
              ),
              const Text(
                '2. Use a loud, clear alarm or shout to alert others in the house.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
