import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/controllers/questionnaire/result_controller.dart';
import 'package:wellbeing_junction/elements/background.dart';

class ResultScreen extends GetView<QuestionController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultScreen";

  @override
  Widget build(BuildContext context) {
    int totalPoints = controller.normalCalculatePoint();

    if (controller.generalQuestionModel.id == 'dass21') {
      // If the quiz is DASS21, show the category points
      Map<String, int> categoryPoints =
          controller.calculatePointsPerCategoryForDass21();
      return Scaffold(
        body: Stack(
          children: [
            const Background(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Score:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('Total Points: $totalPoints',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text('Depression: ${categoryPoints['d']}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Anxiety: ${categoryPoints['a']}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Stress: ${categoryPoints['s']}',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // For other quizzes, show the total points
      return Scaffold(
        body: Stack(
          children: [
            const Background(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Score:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('Total Points: $totalPoints',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
