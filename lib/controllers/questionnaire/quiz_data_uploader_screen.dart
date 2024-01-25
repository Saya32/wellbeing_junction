import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/quiz_data_uploader.dart';

// ignore: must_be_immutable
class QuizDataUploadScreen extends StatelessWidget {
  QuizDataUploadScreen({super.key});
  QuizDataUploader controller = Get.put(QuizDataUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Uploading"),
    ));
  }
}
