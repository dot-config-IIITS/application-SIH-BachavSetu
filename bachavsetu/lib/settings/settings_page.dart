import 'package:bachavsetu/login/welcome.dart';
import 'package:bachavsetu/settings/feedback/history.dart';
import 'package:bachavsetu/settings/meshnetwork.dart';
import 'package:bachavsetu/settings/other/help.dart';
import 'package:bachavsetu/utils/user_preferences.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';

import 'package:bachavsetu/settings/article/articlehomepage.dart';
import 'package:bachavsetu/settings/contactus/contact_us.dart';
import 'package:bachavsetu/settings/emergency/emergency_contact.dart';
import 'package:bachavsetu/settings/feedback/feedback.dart';
import 'package:bachavsetu/settings/mockdrill/mock_drill.dart';
import 'package:bachavsetu/settings/other/privacy_policy.dart';
import 'package:bachavsetu/settings/other/terms_and_conditions.dart';
import 'package:bachavsetu/settings/faq/faq.dart';
import 'package:bachavsetu/settings/settingspage/forward_button.dart';
import 'package:bachavsetu/settings/settingspage/setting_item.dart';
import 'package:bachavsetu/settings/settingspage/edit_screen.dart';

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
        automaticallyImplyLeading: false,
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
              const Text(
                "Emergency",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              SettingItem(
                title: "Emergency",
                icon: Ionicons.call,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
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
              const SizedBox(height: 20),
              SettingItem(
                title: "Mesh Networking",
                icon: Ionicons.globe_outline,
                bgColor: Colors.purple,
                iconColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeshNetwork(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Mock Drills",
                icon: Ionicons.analytics,
                bgColor: Colors.red,
                iconColor: Colors.white,
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
                bgColor: Colors.green,
                iconColor: Colors.white,
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
                title: "Feedback History",
                icon: Ionicons.time,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackHistory(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "FAQ",
                icon: Ionicons.help_circle,
                bgColor: Colors.black,
                iconColor: Colors.white,
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
                bgColor: Colors.grey,
                iconColor: Colors.yellow,
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
                bgColor: Colors.purple,
                iconColor: Colors.white,
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
                bgColor: Colors.green.shade100,
                iconColor: Colors.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Log Out",
                icon: Ionicons.log_out,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  UserPreferences.reset();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Welcome(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
