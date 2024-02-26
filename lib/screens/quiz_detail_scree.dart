import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/elements/background.dart';

class QuizDetailsScreen extends GetView<QuizPaperController> {
  const QuizDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Background());
  }
}
