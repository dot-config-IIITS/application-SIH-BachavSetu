import 'package:flutter/material.dart';

class PowerOutage extends StatelessWidget {
  const PowerOutage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power Outage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Emergency Lighting',
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
                '1. Have a flashlight, batteries, and candles easily accessible.',
              ),
              const Text(
                '2. Use battery-powered lanterns for area lighting.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Appliance Safety',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Unplug appliances to prevent surges when power is restored.',
              ),
              const Text(
                '2. Use generators outdoors in well-ventilated areas.',
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
                '1. Conserve battery power on electronic devices; have a portable charger.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
