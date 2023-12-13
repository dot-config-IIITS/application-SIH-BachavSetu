import 'package:flutter/material.dart';

class Cyclone extends StatelessWidget {
  const Cyclone({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  'https://placekitten.com/200/150', // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
