import 'package:flutter/material.dart';

class SelfAssessmentQuiz extends StatelessWidget {
  const SelfAssessmentQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //  Get.toNamed('/dass21'); // Navigate to DASS-21 quiz screen
              },
              child: const Text('Take DASS-21 Quiz'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get.toNamed('/gad7'); // Navigate to GAD-7 quiz screen
              },
              child: const Text('Take GAD-7 Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
