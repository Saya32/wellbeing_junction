import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';
import 'package:wellbeing_junction/screens/quiz_detail_scree.dart';

// Inspiration to the below code --> https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech

class QuizPaperController extends GetxController {
  late final allQuizTypes = <GeneralQuestionModel>[].obs;

  @override
  void onReady() {
    getAllQuizes();
    super.onReady();
  }

  Future<void> getAllQuizes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await questionnaireCollection.get();
      final selfAssessmentQuizList = data.docs
          .map((paper) => GeneralQuestionModel.fromSnapshot(paper))
          .toList();
      allQuizTypes.assignAll(selfAssessmentQuizList);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void navigatoQuestions(
      {required GeneralQuestionModel paper}) {
        Get.toNamed(QuizDetailsScreen.routeName, arguments: paper);
  }
}
