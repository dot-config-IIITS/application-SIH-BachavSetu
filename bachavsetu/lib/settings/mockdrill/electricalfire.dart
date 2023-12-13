import 'package:flutter/material.dart';

class ElectricalFire extends StatelessWidget {
  const ElectricalFire({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrical Fire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cut Power',
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
                '1. If safe, turn off the power source or unplug the device.',
              ),
              const Text(
                '2. Never use water on an electrical fire.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Use Fire Extinguisher',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. If you have a Class C fire extinguisher, use it.',
              ),
              const Text(
                '2. If not, evacuate and call emergency services.',
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
                '1. If the fire is not easily manageable, evacuate the premises.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
