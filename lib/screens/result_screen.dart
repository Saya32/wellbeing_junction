import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/controllers/questionnaire/result_controller.dart';
import 'package:wellbeing_junction/elements/background.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/warning.dart';

class ResultScreen extends GetView<QuestionController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultScreen";

  @override
  Widget build(BuildContext context) {
    int totalPoints = controller.normalCalculatePoint();
    String quizType = controller.generalQuestionModel.id;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const WarningText(),
                Expanded(
                  child: Center(
                    child: (controller.generalQuestionModel.id == 'dass21')
                        ? buildDASS21Content(context, totalPoints)
                        : buildGeneralQuizContent(
                            context, totalPoints, quizType),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: blackButtonStyle,
                        onPressed: () {},
                        child: const Text('Get an Insight'),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: blackButtonStyle,
                        onPressed: () {},
                        child: const Text('Get a Tips and Advice'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDASS21Content(BuildContext context, int totalPoints) {
    Map<String, int> categoryPoints =
        controller.calculatePointsPerCategoryForDass21();
    Map<String, String> scoreLevels =
        controller.getDass21ScoreLevels(categoryPoints);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Your Score',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
    );
  }

  Widget buildGeneralQuizContent(
      BuildContext context, int totalPoints, String quizType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Your Score',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text('Total Points: $totalPoints',
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Text(controller.getScoreLevel(totalPoints, quizType),
            style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
