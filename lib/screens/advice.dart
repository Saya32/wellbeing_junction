//https://pub.dev/packages/url_launcher

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellbeing_junction/elements/background.dart';

class AdviceScreen extends StatefulWidget {
  const AdviceScreen({super.key});
  static const String routeName = "/advice";

  @override
  State<AdviceScreen> createState() => _AdviceScreenState();
}

class _AdviceScreenState extends State<AdviceScreen> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch the Url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Card(
                    color: const Color.fromARGB(255, 223, 20, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Text(
                      'If you or someone else is in danger, call 999 or go to A&E now. If you need help urgently for your mental health, but it\'s not an emergency, get help from NHS 111 online or call 111. Your mental health is as important as your physical health. You will not be wasting anyone\'s time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Card(
                  color: const Color.fromARGB(255, 241, 186, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    'The following guidance is intended for individuals experiencing mild to moderate levels of stress, anxiety, and depression. If you are dealing with severe or extremely severe levels of these conditions, it is recommended to promptly seek medical assistance. Furthermore, please be aware that the in-app quiz is designed for informational purposes only and should not be considered a substitute for professional medical help.',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: 45,
                    ),
                    Text(
                      'Stress',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 163, 214, 137),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Ways to Manage and Reduce Stress',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onTap: () => _launchURL(
                        'https://www.mentalhealth.org.uk/explore-mental-health/publications/how-manage-and-reduce-stress'),
                  ),
                ),
                const SizedBox(height: 8.0),
                Card(
                  color: const Color.fromARGB(255, 163, 214, 137),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Tools and Activities to reduce your stress!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onTap: () => _launchURL(
                        'https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/tips-to-reduce-stress/'),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  children: [
                    Icon(
                      Icons.mood_bad,
                      size: 45,
                    ),
                    Text(
                      'Anxiety',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 214, 218, 117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Self-Help Guide to Manage Your Anxiety!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onTap: () => _launchURL(
                        'https://www.nhsinform.scot/illnesses-and-conditions/mental-health/mental-health-self-help-guides/anxiety-self-help-guide/'),
                  ),
                ),
                const SizedBox(height: 8.0),
                Card(
                  color: const Color.fromARGB(255, 214, 218, 117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () => _launchURL(
                        'https://www.beyondblue.org.au/mental-health/anxiety/treatments-for-anxiety/anxiety-management-strategies'),
                    title: const Text(
                      'Anxiety Management Strategies!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  children: [
                    Icon(
                      Icons.sentiment_very_dissatisfied,
                      size: 45,
                    ), // Icon of a sad person
                    Text(
                      'Depression',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 225, 194, 117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () => _launchURL(
                        'https://www.nhsinform.scot/illnesses-and-conditions/mental-health/mental-health-self-help-guides/depression-self-help-guide/'),
                    title: const Text(
                      'Self-Help Guide to Manage Your Depression!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Card(
                  color: const Color.fromARGB(255, 225, 194, 117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () => _launchURL(
                        'https://www.nhs.uk/mental-health/self-help/tips-and-support/cope-with-depression/'),
                    title: const Text(
                      'Depression Management Strategies!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Row(
                  children: [
                    Icon(
                      Icons.emoji_emotions,
                      size: 45,
                    ),
                    Text(
                      'General Help',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(255, 236, 232, 159),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () => _launchURL(
                        'https://www.nhs.uk/service-search/mental-health/find-an-NHS-talking-therapies-service/'),
                    title: const Text(
                      'Free Talking Therapy with NHS!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Card(
                  color: const Color.fromARGB(255, 236, 232, 159),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    onTap: () => _launchURL(
                        'https://www.nhs.uk/nhs-services/mental-health-services/how-to-find-local-mental-health-services/'),
                    title: const Text(
                      'Local Mental Health Services and Support!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
