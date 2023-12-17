import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bachavsetu/settings/contactus/contact_card.dart';

class ContactUsPage extends StatelessWidget {
  final List<ContactCard> developers = [
    ContactCard(
      name: '.config',
      role: 'Our Team',
      githubUrl: 'https://github.com/dot-config',
      linkedinUrl: 'mailto:dotconfig@proton.me?subject=From BachavSetu App',
    ),
    ContactCard(
      name: 'Vinayak Anand',
      role: 'Flutter Developer',
      githubUrl: 'https://github.com/Vinayak-Anand',
      linkedinUrl: 'https://www.linkedin.com/in/vinayak-anand/',
    ),
    ContactCard(
      name: 'Hruthik Chitti',
      role: 'Backend Developer',
      githubUrl: 'https://github.com/Hruthik0x',
      linkedinUrl:
          'https://www.linkedin.com/in/hruthik-chitti-0827ab276/?originalSubdomain=in',
    ),
    ContactCard(
      name: 'Suvan Sarkar',
      role: 'Backend Developer',
      githubUrl: 'https://github.com/Suvansarkar',
      linkedinUrl: 'https://www.linkedin.com/in/suvan-sarkar-b1438017a/',
    ),
    ContactCard(
      name: 'Bishwajeet Sahoo',
      role: 'Flutter Developer',
      githubUrl: 'https://github.com/SahooBishwajeet',
      linkedinUrl: 'https://www.linkedin.com/in/bishwajeet-sahoo/',
    ),
    ContactCard(
      name: 'Shrishti Mahor',
      role: 'UI/UX Designer',
      githubUrl: 'https://github.com/shrishti0308',
      linkedinUrl: 'https://www.linkedin.com/in/shrishti-mahor/',
    ),
    ContactCard(
      name: 'Piyush Singh',
      role: 'Flutter Developer',
      githubUrl: 'https://github.com/piyush-bug',
      linkedinUrl: 'https://www.linkedin.com/in/piyush-bug/',
    ),
    ContactCard(
      name: 'Saurabh Pal',
      role: 'Backend Developer',
      githubUrl: 'https://github.com/virinci',
      linkedinUrl: 'https://www.linkedin.com/in/virinci/',
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

class ContactCardWidget extends StatelessWidget {
  final ContactCard contactCard;

  const ContactCardWidget({Key? key, required this.contactCard})
      : super(key: key);

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/settingsAssets/avatar.png',
              height: 120.0,
              width: 120.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactCard.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    contactCard.role,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            _launchUrl(Uri.parse(contactCard.githubUrl)),
                        child: const Icon(
                          Ionicons.logo_github,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () =>
                            _launchUrl(Uri.parse(contactCard.linkedinUrl)),
                        child: contactCard.linkedinUrl.contains('@')
                            ? const Icon(
                                Ionicons.mail,
                                size: 24.0,
                              )
                            : const Icon(
                                Ionicons.logo_linkedin,
                                size: 24.0,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
