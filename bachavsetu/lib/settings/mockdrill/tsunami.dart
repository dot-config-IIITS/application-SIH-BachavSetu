import 'package:flutter/material.dart';

class Tsunami extends StatelessWidget {
  const Tsunami({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tsunami'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Immediate Action',
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
                '1. Move to higher ground immediately if near the coast.',
              ),
              const Text(
                '2. Follow designated evacuation routes; do not stay on the beach.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Alert Systems',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay tuned to official tsunami alerts and warnings.',
              ),
              const Text(
                '2. Be aware of community warning systems.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Aftershocks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Be cautious of potential aftershocks and secondary waves.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
