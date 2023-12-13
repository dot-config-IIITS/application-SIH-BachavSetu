import 'package:flutter/material.dart';

class ChemicalSpill extends StatelessWidget {
  const ChemicalSpill({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Spill/Industrial Accident'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Immediate Evacuation',
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
                '1. Evacuate the area immediately if instructed by authorities.',
              ),
              const Text(
                '2. Follow designated evacuation routes.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Protection Measures',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay upwind and uphill from the source of the chemical release.',
              ),
              const Text(
                '2. Seal windows and doors with plastic sheeting and duct tape.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Medical Attention',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.network(
                    'https://placekitten.com/200/150'), // Replace with actual image URL
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Seek medical attention if exposed to hazardous substances.',
              ),
              const Text(
                '2. Follow decontamination procedures if applicable.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
