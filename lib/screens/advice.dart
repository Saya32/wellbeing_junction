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
          Background(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Card(
                    color: Color.fromARGB(255, 223, 20, 20),
                    child: Text(
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
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.mentalhealth.org.uk/explore-mental-health/publications/how-manage-and-reduce-stress'),
                  child: const Text(
                    'Stress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/tips-to-reduce-stress/'),
                  child: const Text(
                    'Tips to reduce stress',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.nhsinform.scot/illnesses-and-conditions/mental-health/mental-health-self-help-guides/anxiety-self-help-guide/'),
                  child: const Text(
                    'Anxiety',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.beyondblue.org.au/mental-health/anxiety/treatments-for-anxiety/anxiety-management-strategies'),
                  child: const Text(
                    'Anxiety management strategies',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () => _launchURL(
                      'https://www.nhs.uk/service-search/mental-health/find-an-NHS-talking-therapies-service/'),
                  child: const Text(
                    'Find an NHS talking therapies service',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'General Help',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
