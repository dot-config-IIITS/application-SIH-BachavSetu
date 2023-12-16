import 'package:bachavsetu/settings/article/articles_details_page.dart';
import 'package:bachavsetu/settings/contactus/contact_us.dart';
import 'package:bachavsetu/settings/emergency/emergency_contact.dart';
import 'package:bachavsetu/settings/feedback/feedback.dart';
import 'package:bachavsetu/settings/mockdrill/mock_drill.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'article/articlehomepage.dart';
import 'edit_item.dart';
import 'faq/faq.dart';
import 'forward_button.dart';
import 'other/privacy_policy.dart';
import 'other/terms_and_conditions.dart';
import 'setting_item.dart';
import 'setting_switch.dart';
import 'edit_screen.dart';
import 'package:bachavsetu/login/form.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("assets/settingsAssets/avatar.png",
                        width: 70, height: 70),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Team .config",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Smart India Hackathon",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {
                        // print("Button Clicked!!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditAccountScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SettingItem(
                title: "Emergency Contact",
                icon: Ionicons.call,
                bgColor: Colors.deepPurple.shade100,
                iconColor: Colors.deepPurple,
                value: "English",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Emergency(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              SettingItem(
                title: "Mock Drills",
                icon: Ionicons.analytics,
                bgColor: Colors.deepPurple.shade100,
                iconColor: Colors.deepPurple,
                value: "English",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MockDrill(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Articles",
                icon: Ionicons.newspaper,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "English",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleHomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              const Text(
                "Other Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Contact Us!",
                icon: Ionicons.mail,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "English",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Send Feedback",
                icon: Ionicons.chatbubble,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackForm(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "FAQ",
                icon: Ionicons.help_circle,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAQPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Privacy Policy",
                icon: Ionicons.lock_closed,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Terms of Service",
                icon: Ionicons.document,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Help",
                icon: Ionicons.help_circle,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
