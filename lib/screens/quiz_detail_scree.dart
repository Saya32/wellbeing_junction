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
          Center(child: Text("No data found")),
        ],
      ),
    );
  }
}
