import 'package:flutter/material.dart';

import 'package:bachavsetu/settings/contactus/contact_us.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
                '1. Information We Collect',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We collect information that you provide directly to us, such as your name, email address, and any other information you choose to provide.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '2. How We Use Your Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We may use the information we collect for various purposes, including to provide, maintain, and improve our services, and to send you updates and promotional materials.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '3. Cookies',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We may use cookies to collect information and improve our services. You have the option to disable cookies in your browser settings.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '4. Third-Party Links and Services',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Our services may contain links to third-party websites or services. We are not responsible for the practices or policies of these third parties.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '5. Security',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We take reasonable measures to help protect your information, but no method of transmission over the internet or electronic storage is 100% secure.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '6. Changes to the Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'We may update our Privacy Policy from time to time. Any changes will be reflected on this page, and the date of the latest update will be indicated at the top.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                '7. Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()));
                },
                child: const Text(
                  'If you have any questions about our Privacy Policy, please contact us here.',
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
}
