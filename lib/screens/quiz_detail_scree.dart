import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/elements/answer_tile.dart';
import 'package:wellbeing_junction/elements/background.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/screens/result_screen.dart';

class QuizDetailsScreen extends GetView<QuestionController> {
  const QuizDetailsScreen({super.key});
  static const String routeName = "/quizDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            const Background(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 110.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.currentSelectedQuestion.value != null)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            controller.currentSelectedQuestion.value!.question,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  else
                    const Text(
                      "Please wait while the question is updated. Thank you for your patience",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 50),
                  GetBuilder<QuestionController>(
                    id: 'options_lists',
                    builder: (context) {
                      final options =
                          controller.currentSelectedQuestion.value?.options;
                      if (options != null) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final answer = options[index];
                            return AnswerTile(
                              answer: '${answer.points}. ${answer.text}',
                              onTap: () {
                                controller.selectedAnswerOptions(
                                    answer.points.toString());
                              },
                              selected: answer.points ==
                                  int.tryParse(controller
                                          .currentSelectedQuestion
                                          .value!
                                          .selectedOption ??
                                      '0'),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 10),
                          itemCount: options.length,
                        );
                      } else {
                        return const Text(
                            "Please wait while the options are loading");
                      }
                    },
                  ),
                  ColoredBox(
                    color: const Color.fromRGBO(234, 176, 19, 0.004),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          if (!controller.firstQuestionNumber)
                            ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: controller.previousQuestion,
                              child: const Icon(Icons.arrow_back),
                            ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: controller.lastQuestionNumber
                                ? () => Get.toNamed('/resultScreen')
                                : controller.nextQuestion,
                            child: Text(controller.lastQuestionNumber
                                ? 'Complete'
                                : 'Next'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
