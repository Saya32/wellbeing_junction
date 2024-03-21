import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/elements/answer_tile.dart';
import 'package:wellbeing_junction/elements/background.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class QuizDetailsScreen extends GetView<QuestionController> {
  const QuizDetailsScreen({super.key});
  static const String routeName = "/quizDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.currentSelectedQuestion.value != null
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  controller
                                      .currentSelectedQuestion.value!.question,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Text(
                          "Please wait while the question is updated. Thank you for your patience",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                Expanded(
                  child: GetBuilder<QuestionController>(
                    builder: (context) {
                      final options =
                          controller.currentSelectedQuestion.value?.options;
                      if (options != null) {
                        return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final answer = options[index];
                              return AnswerTile(
                                answer: '${answer.points}.${answer.text}',
                                onTap: () {
                                  controller.selectedAnswerOptions(
                                      answer.points as String?);
                                },
                                selected: answer.points ==
                                    int.tryParse(controller
                                            .currentSelectedQuestion
                                            .value!
                                            .selectedOption ??
                                        '0'),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                            itemCount: options.length);
                      } else {
                        return const Text("No options available");
                      }
                    },
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
