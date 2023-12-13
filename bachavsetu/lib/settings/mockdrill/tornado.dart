import 'package:flutter/material.dart';

class Tornado extends StatelessWidget {
  const Tornado({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tornado'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shelter',
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
                '1. Seek shelter in a basement or an interior room on the lowest floor.',
              ),
              const Text(
                '2. Avoid windows and protect your head and neck with sturdy furniture or a mattress.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Communication',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Listen to weather alerts and warnings via a NOAA Weather Radio.',
              ),
              const Text(
                '2. Establish a family communication plan.',
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
                '1. Stay informed about tornado risks in your area.',
              ),
              const Text(
                '2. Be prepared to take immediate action if a tornado warning is issued.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
