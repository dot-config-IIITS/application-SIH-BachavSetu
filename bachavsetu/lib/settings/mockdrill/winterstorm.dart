import 'package:flutter/material.dart';

class WinterStorm extends StatelessWidget {
  const WinterStorm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winter Storm'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Indoor Safety',
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
                '1. Stay indoors during severe weather and limit travel.',
              ),
              const Text(
                '2. Dress warmly in layers to prevent hypothermia.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Emergency Supplies',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Keep extra blankets, non-perishable food, water, and medications.',
              ),
              const Text(
                '2. Check on elderly or vulnerable neighbors.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Power Outages',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Be prepared for power outages; have flashlights, batteries, and candles on hand.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
