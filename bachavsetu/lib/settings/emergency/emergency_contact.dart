import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final Map<String, String> emergencyNumbers = {
    'Police': '100',
    'Fire': '101',
    'Ambulance': '102',
    'Disaster Management Services': '108',
    'Senior Citizen Helpline': '1291',
    'Railway Accident Emergency Service': '1072',
    'Road Accident Emergency Service': '1073',
    'Air Ambulance': '9540161344',
    'National Disaster Response Force (NDRF)': '011-26701728',
    'Indian Red Cross Society': '011-23716441',
    'Disaster Distress Helpline': '1078',
    'Helpline for Natural Disasters': '011-26701836',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contact Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: emergencyNumbers.length,
          itemBuilder: (context, index) {
            final entry = emergencyNumbers.entries.elementAt(index);
            final phoneNumber = entry
                .value; // Use the actual method to access the number from your map

            return ListTile(
              title: Text(entry.key),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () async {
                  final Uri url = Uri(
                      scheme: 'tel',
                      path:
                          phoneNumber); // Use the complete phone number with "tel:" prefix
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch dialer for $url';
                    // Consider showing a fallback option here
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
