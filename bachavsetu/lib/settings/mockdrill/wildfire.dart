import 'package:flutter/material.dart';

class WildFire extends StatelessWidget {
  const WildFire({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  'https://placekitten.com/200/150', // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
