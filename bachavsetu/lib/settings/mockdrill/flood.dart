import 'package:flutter/material.dart';

class Flood extends StatelessWidget {
  const Flood({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  'https://placekitten.com/200/150', // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Avoid walking or driving through flooded areas.',
              ),
              const Text(
                '2. Have an emergency kit containing important documents, medications, and basic supplies.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
