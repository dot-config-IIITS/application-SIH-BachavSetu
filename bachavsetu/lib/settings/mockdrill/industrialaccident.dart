import 'package:flutter/material.dart';

class IndustrialAccident extends StatelessWidget {
  const IndustrialAccident({Key? key});

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
              'Industrial Accident Alert!',
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
        title: const Text('Industrial Accident'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Before an Industrial Accident',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/industrialaccident/i1.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Be familiar with emergency exits and evacuation routes at your workplace.',
              ),
              const Text(
                '2. Participate in workplace safety training and drills.',
              ),
              const Text(
                '3. Know the locations of emergency equipment, such as fire extinguishers and first aid kits.',
              ),
              const SizedBox(height: 16),
              const Text(
                'During an Industrial Accident',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/industrialaccident/i2.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Follow emergency procedures and evacuate the area immediately if instructed.',
              ),
              const Text(
                '2. Use protective equipment, such as safety goggles, gloves, and masks, if available.',
              ),
              const Text(
                '3. If there\'s a chemical spill, move upwind to avoid inhaling toxic fumes.',
              ),
              const SizedBox(height: 16),
              const Text(
                'After an Industrial Accident',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/mock/industrialaccident/i3.png',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Seek medical attention for any injuries or exposure to hazardous substances.',
              ),
              const Text(
                '2. Report the incident to your supervisor or designated authority.',
              ),
              const Text(
                '3. Follow decontamination procedures if you were exposed to hazardous materials.',
              ),
              const SizedBox(height: 8),
              const Text(
                '4. Cooperate with emergency responders and follow their instructions.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
