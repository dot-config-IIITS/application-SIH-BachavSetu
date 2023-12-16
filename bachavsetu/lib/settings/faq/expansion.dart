import 'package:flutter/material.dart';
import 'faq_item.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<FAQItem> _data = [
    FAQItem(
      headerValue: 'What is BachavSetu?',
      expandedValue:
          'BachavSetu is a disaster management application designed to provide timely information and assistance during various types of disasters. It aims to enhance the safety and preparedness of individuals and communities by offering real-time alerts, guidance, and resources.',
    ),
    FAQItem(
      headerValue: 'How does BachavSetu help during a disaster?',
      expandedValue:
          'BachavSetu provides real-time alerts about impending disasters, offers guidance on how to prepare and respond, and connects users with emergency services and resources. It also includes features for reporting emergencies and sharing location information with rescuers.',
    ),
    FAQItem(
      headerValue: 'Is BachavSetu available on all mobile platforms?',
      expandedValue:
          '[Provide information about the platforms on which your application is available, e.g., Android, iOS, etc.]',
    ),
    FAQItem(
      headerValue: 'How can I report an emergency using BachavSetu?',
      expandedValue:
          'Users can report emergencies directly through the application by providing details of the situation and their location. This information is immediately relayed to the relevant emergency services for a quick response.',
    ),
    FAQItem(
      headerValue:
          'Can I use BachavSetu to get information about local shelters and aid centers?',
      expandedValue:
          'Yes, BachavSetu provides information about nearby shelters, aid centers, and other essential services during a disaster. Users can access this information to find immediate assistance and support.',
    ),
    FAQItem(
      headerValue:
          'Is there a feature for family and friends to stay connected during a disaster?',
      expandedValue:
          '[If your application has a feature like this, describe it here. If not, you can mention any related features or future plans for such a feature.]',
    ),
    FAQItem(
      headerValue:
          'How does BachavSetu ensure the accuracy of its disaster alerts and information?',
      expandedValue:
          'BachavSetu sources its information from reliable and official sources, ensuring that the alerts and guidance provided are accurate and up-to-date. The application is regularly updated to maintain the quality of information.',
    ),
    FAQItem(
      headerValue:
          'Is there a way to customize the type of disaster alerts I receive?',
      expandedValue:
          '[If your application allows customization of alerts, describe how users can set their preferences.]',
    ),
    FAQItem(
      headerValue:
          'What should I do if I encounter technical issues with BachavSetu?',
      expandedValue:
          'For any technical issues, users can contact our support team through dotconfig@proton.me. We are committed to resolving issues promptly to ensure the app\'s effectiveness during critical times.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((FAQItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
