import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/elements/background.dart';

class QuizDetailsScreen extends GetView<QuestionController> {
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Center(
              child: Obx(() => (Text(
                  controller.currentSelectedQuestion.value?.question ??
                      'No question available')))),
        ],
      ),
    );
  }
}
