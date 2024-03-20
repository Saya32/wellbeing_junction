import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/elements/background.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

// class QuizDetailsScreen extends GetView<QuestionController> {
//   const QuizDetailsScreen(GeneralQuestionModel paper, {super.key});
//   static const String routeName = "/quizDetailsScreen";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Background(),
//           Center(child: Text("No data found")),
//         ],
//       ),
//     );
//   }
// }

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
            padding: const EdgeInsets.only(
                top: 20.0), // Adjust top padding as needed
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align children to the top
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center children horizontally
              children: [
                Obx(() => controller.currentSelectedQuestion.value != null
                    ? Text(
                        controller.currentSelectedQuestion.value!.question,
                        style: TextStyle(
                          fontSize: 24.0, // Adjust font size as needed
                          fontWeight: FontWeight.bold, // Makes text bold
                        ),
                        textAlign: TextAlign.center, // Center text horizontally
                      )
                    : Text(
                        "No question selected",
                        style: TextStyle(
                          fontSize: 24.0, // Adjust font size as needed
                          fontWeight: FontWeight.bold, // Makes text bold
                        ),
                      )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
