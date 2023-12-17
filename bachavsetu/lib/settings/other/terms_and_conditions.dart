import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bachavsetu/settings/contactus/contact_us.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last Updated: 15-12-2023',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                '1. Acceptance of Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'By accessing or using BachavSetu (the "App"), you agree to comply with and be bound by these Terms & Conditions. If you do not agree to these Terms, please do not use the App.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '2. Use of the App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '(a) Eligibility: You must be at least 12 years old to use the App. By using the App, you represent and warrant that you are of legal age to form a binding contract.',
              ),
              const Text(
                '(b) Account: To use certain features of the App, you may be required to create an account. You are responsible for maintaining the confidentiality of your account information and are fully responsible for all activities that occur under your account.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '3. Content',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '(a) User Content: You may be able to submit content to the App, including but not limited to text, images, and other materials. You are solely responsible for the content you submit, and you grant dot-config a non-exclusive, worldwide, royalty-free, sublicensable, and transferable license to use, reproduce, distribute, prepare derivative works of, display, and perform your content.',
              ),
              const Text(
                '(b) Prohibited Content: You agree not to submit content that is illegal, obscene, threatening, defamatory, invasive of privacy, infringing on intellectual property rights, or otherwise objectionable.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '4. Intellectual Property',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'The App and its original content, features, and functionality are owned by dot-config and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '5. Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => _launchUrl(
                    Uri.parse('https://github.com/dot-config-IIITS/')),
                child: const Text(
                  'Your use of the App is also governed by our Privacy Policy, which can be found at Link to Privacy Policy',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                '6. Termination',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We may terminate or suspend your account and access to the App immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach these Terms.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '7. Governing Law',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'These Terms are governed by and construed in accordance with the laws of Information Technology Act, 2000 (India), and you irrevocably submit to the exclusive jurisdiction of the courts in that state or location.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '8. Changes to Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We reserve the right to update or change these Terms at any time. Your continued use of the App after we post any modifications to the Terms will constitute your acknowledgment of the modifications and your consent to abide and be bound by the modified Terms.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Contact Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()));
                },
                child: const Text(
                  'Our Contact Information',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
