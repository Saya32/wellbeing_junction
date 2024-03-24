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
    String quizType = controller.generalQuestionModel.id;

    if (controller.generalQuestionModel.id == 'dass21') {
      Map<String, int> categoryPoints =
          controller.calculatePointsPerCategoryForDass21();
      Map<String, String> scoreLevels =
          controller.getDass21ScoreLevels(categoryPoints);

      return Scaffold(
        body: Stack(
          children: [
            const Background(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your Score',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text('Total Points: $totalPoints',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  Text('Depression: ${categoryPoints['d']}',
                      style: const TextStyle(fontSize: 18)),
                  Text('Depression Level: ${scoreLevels['Depression']}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Anxiety: ${categoryPoints['a']}',
                      style: const TextStyle(fontSize: 18)),
                  Text('Anxiety Level: ${scoreLevels['Anxiety']}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Stress: ${categoryPoints['s']}',
                      style: const TextStyle(fontSize: 18)),
                  Text('Stress Level: ${scoreLevels['Stress']}',
                      style: const TextStyle(fontSize: 18)),
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
                  const Text('Your Score',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text('Total Points: $totalPoints',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  Text(
                      'Score Level: ${controller.getScoreLevel(totalPoints, quizType)}',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
