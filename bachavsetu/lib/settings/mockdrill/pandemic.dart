import 'package:flutter/material.dart';

class Pandemic extends StatelessWidget {
  const Pandemic({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pandemic'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hygiene Practices',
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
                '1. Follow public health guidelines, including regular handwashing.',
              ),
              const Text(
                '2. Wear masks and practice social distancing.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Stocking Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stock up on essential supplies, medications, and personal protective equipment.',
              ),
              const Text(
                '2. Have a plan for obtaining medications if needed.',
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
                '1. Stay informed about the latest updates from health authorities.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
