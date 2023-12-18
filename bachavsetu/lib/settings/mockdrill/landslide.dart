import 'package:flutter/material.dart';

class Landslide extends StatelessWidget {
  const Landslide({Key? key});

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
              'Landslide Alert In Your Area!',
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
        title: const Text('Landslide'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Before a Landslide',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/landslide/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Identify potential landslide-prone areas in your vicinity.',
              ),
              const Text(
                '2. Have an emergency kit ready with essential supplies (water, non-perishable food, first aid kit, flashlight, etc.).',
              ),
              const Text(
                '3. Develop a family emergency plan and communication strategy.',
              ),
              const Text(
                '4. Monitor weather forecasts and alerts regularly.',
              ),
              const SizedBox(height: 16),
              const Text(
                'During a Landslide Warning',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/landslide/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Evacuate immediately if authorities issue a landslide warning or evacuation order.',
              ),
              const Text(
                '2. Avoid areas vulnerable to landslides, such as steep slopes, cliffs, or riverbanks.',
              ),
              const Text(
                '3. Stay tuned to local radio or emergency services for updates.',
              ),
              const SizedBox(height: 16),
              const Text(
                'During a Landslide',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/landslide/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. If caught in a landslide while driving, abandon the vehicle and seek higher ground on foot.',
              ),
              const Text(
                '2. Move to an upper floor if indoors, or climb to higher ground if outdoors.',
              ),
              const Text(
                '3. Avoid river valleys and low-lying areas.',
              ),
              const SizedBox(height: 16),
              const Text(
                'After a Landslide',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Stay away from the landslide-affected area.',
              ),
              const Text(
                '2. Check for injuries and administer first aid as needed.',
              ),
              const Text(
                '3. Report damaged utility lines, such as gas, water, and electricity.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
