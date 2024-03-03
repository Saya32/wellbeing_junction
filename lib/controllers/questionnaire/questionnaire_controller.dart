import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_service.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';
import 'package:wellbeing_junction/screens/self_assessment_quiz.dart';

class QuizPaperController extends GetxController {
  final RxList<GeneralQuestionModel> allPapers = <GeneralQuestionModel>[].obs;

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
      final paperList = data.docs
          .map((paper) => GeneralQuestionModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
  // GeneralQuestionModel getPaperById(String id) {

  //   return allPapers.firstWhere((paper) => paper.id == id);

  // }

  void navigatoQuestions(
      {required GeneralQuestionModel paper, bool isTryAgain = false}) {
    AuthService authController = Get.find();
    if (authController.isLogedIn()) {
      if (isTryAgain) {
        Get.back();
        Get.to(const QuizPaperScreen(),
            arguments: paper, preventDuplicates: false);
      } else {
        Get.to(const QuizPaperScreen(), arguments: paper);
      }
    }
  }
}
