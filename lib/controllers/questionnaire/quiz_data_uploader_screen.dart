import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/quiz_data_uploader.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/update_status.dart';

// Applied GetX logic using youtube tutorial--> https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech

// ignore: must_be_immutable
class QuizDataUploadScreen extends StatelessWidget {
  QuizDataUploadScreen({super.key});
  final QuizDataUploader controller = Get.put(QuizDataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          controller.updateStatus.value == UpdateStatus.completed
              ? "Upload is complete now"
              : "It's still uploading")),
    ));
  }
}
