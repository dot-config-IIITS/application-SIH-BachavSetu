import 'package:flutter/material.dart';

class Earthquake extends StatelessWidget {
  const Earthquake({Key? key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  'https://placekitten.com/200/150', // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
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
