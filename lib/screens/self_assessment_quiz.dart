// Modification for code using: https://stackoverflow.com/questions/73834905/flutter-streambuilder-widget-error-type-mapstring-dynamic-is-not
//https://medium.com/quick-code/reading-lists-from-firestore-using-streambuilder-in-flutter-eda590f461ed

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/elements/quiz_tile.dart';

class SelfAssessmentScreen extends StatelessWidget {
  const SelfAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizPaperController());
    QuizPaperController quizPaperController = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 126, 84),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 216, 67, 67),
                      ),
                      Expanded(
                        child: Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 241, 241),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Select a quiz to gain insights into your mental health. Please note that this tool is for informational purposes only and does not substitute medical or professional treatment.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                child: Material(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  clipBehavior: Clip.hardEdge,
                  child: Ink(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 195, 157),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return QuizTile(
                              model: quizPaperController.allPapers[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                        itemCount: quizPaperController.allPapers.length,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
