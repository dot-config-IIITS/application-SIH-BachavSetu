import 'package:flutter/material.dart';

class RoadAccident extends StatelessWidget {
  const RoadAccident({Key? key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning),
                SizedBox(width: 8),
                Text('Alert'),
                SizedBox(width: 8),
                Icon(Icons.warning),
              ],
            ),
            content: const Text(
              'Road Accident Alert In Your Area!',
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ensure Your Safety'),
                ),
              ),
            ],
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Road Accidents'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Initial Safety Measures',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/roadaccident/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Move to a Safe Location',
              ),
              const Text(
                '1. If possible, move vehicles to the side of the road to avoid further accidents.',
              ),
              const Text(
                '2. Turn on hazard lights to alert other drivers.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Check for Injuries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/roadaccident/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Assess yourself and others for injuries.',
              ),
              const Text(
                '2. Call emergency services if there are injuries.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Medical Assistance',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/roadaccident/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Seek Medical Attention',
              ),
              const Text(
                '2. Even if injuries seem minor, seek medical attention promptly.',
              ),
              const Text(
                '3. Call emergency services for immediate assistance.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Legal and Insurance',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/roadaccident/i4.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. File a Police Report',
              ),
              const Text(
                '2. File a report with law enforcement.',
              ),
              const Text(
                '3. Obtain a copy of the report for insurance purposes.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Communication',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Exchange Information',
              ),
              const Text(
                '1. Exchange names, addresses, phone numbers, insurance information, and vehicle details with other parties involved.',
              ),
              const Text(
                '2. Obtain contact information for witnesses.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Document the Scene',
              ),
              const Text(
                '1. Take pictures of the accident scene, including vehicle positions and damage.',
              ),
              const Text(
                '2. Note road conditions and any relevant details.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Contact Insurance',
              ),
              const Text(
                '1. Notify your insurance company as soon as possible.',
              ),
              const Text(
                '2. Provide accurate and detailed information.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
