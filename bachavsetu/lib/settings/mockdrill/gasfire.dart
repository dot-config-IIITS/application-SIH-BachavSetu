import 'package:flutter/material.dart';

class GasFire extends StatelessWidget {
  const GasFire({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gas Fires & Flammable Liquid Fires'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Turn off the Gas Supply',
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
                '1. Turn off the gas supply if safe.',
              ),
              const Text(
                '2. Do not use water; use a fire extinguisher designed for flammable liquids.',
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
                '1. Evacuate and call emergency services.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
