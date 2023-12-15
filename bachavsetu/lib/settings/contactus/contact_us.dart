import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final List<ContactCard> developers = [
    ContactCard(
      name: 'John Doe',
      role: 'Flutter Developer',
      imageUrl: 'https://example.com/john_doe_image.jpg',
      githubUrl: 'https://github.com/johndoe',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContactCardWidget(contactCard: developers[index]),
          );
        },
      ),
    );
  }
}

class ContactCard {
  final String name;
  final String role;
  final String imageUrl;
  final String githubUrl;
  final String linkedinUrl;

  ContactCard({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.githubUrl,
    required this.linkedinUrl,
  });
}

class ContactCardWidget extends StatelessWidget {
  final ContactCard contactCard;

  const ContactCardWidget({Key? key, required this.contactCard})
      : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            contactCard.imageUrl,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactCard.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 4.0),
                Text(contactCard.role),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    InkWell(
                      onTap: () => _launchURL(contactCard.githubUrl),
                      child: Image.asset(
                        'assets/github_logo.png', // Replace with your GitHub logo asset
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    InkWell(
                      onTap: () => _launchURL(contactCard.linkedinUrl),
                      child: Image.asset(
                        'assets/linkedin_logo.png', // Replace with your LinkedIn logo asset
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
