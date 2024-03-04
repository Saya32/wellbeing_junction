// Modification for code using: https://stackoverflow.com/questions/73834905/flutter-streambuilder-widget-error-type-mapstring-dynamic-is-not
//https://medium.com/quick-code/reading-lists-from-firestore-using-streambuilder-in-flutter-eda590f461ed

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/elements/quiz_tile.dart';

class SelfAssessmentScreen extends StatelessWidget {
  const SelfAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizPaperController = Get.find();
    return Scaffold(
        body: Obx(() => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return QuizTile(model: quizPaperController.allPapers[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: quizPaperController.allPapers.length)));
  }
}
