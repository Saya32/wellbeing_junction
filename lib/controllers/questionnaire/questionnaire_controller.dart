import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';
import 'package:wellbeing_junction/screens/quiz_detail_scree.dart';

import '../../auth/auth_service.dart';
import '../../screens/self_assessment_quiz.dart';

class QuizPaperController extends GetxController {
  late final allPapers = <GeneralQuestionModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    //isLoading(true);
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await questionnaireCollection.get();
      final selfAssessmentQuizList = data.docs
          .map((paper) => GeneralQuestionModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(selfAssessmentQuizList);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void navigatoQuestions(
      {required GeneralQuestionModel paper, bool isTryAgain = false}) {
    AuthService authController = Get.find();
    if (authController.isLogedIn()) {
      if (isTryAgain) {
        Get.back();
        Get.to(const SelfAssessmentScreen(),
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuizDetailsScreen.routeName, arguments: paper);
      }
    }
  }
}
