import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class QuestionController extends GetxController {
  late GeneralQuestionModel generalQuestionModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentSelectedQuestion =
      Rxn<Questions>(); // making the current questions observable

  @override
  void onReady() {
    final arguments = Get.arguments;

    if (arguments is GeneralQuestionModel) {
      final questionPaper = arguments;

      loadQuestionsDetails(questionPaper);
    }

    super.onReady();
  }

  Future<void> loadQuestionsDetails(GeneralQuestionModel questionPaper) async {
    generalQuestionModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>>
          questionsList = //retriving from firebase so have to cast around QuerySnapshot
          await questionnaireCollection
              .doc(questionPaper.id)
              .collection("questions")
              .get();
      final questions = questionsList.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();

      questionPaper.questions =
          questions; //saved the questions retrieved from firebase to the question variable
      for (Questions question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> optionList =
            await questionnaireCollection
                .doc(questionnaireCollection.id)
                .collection('questions')
                .doc(question.id)
                .collection('options')
                .get();
        final options =
            optionList.docs.map((text) => Options.fromSnapshot(text)).toList();
        question.options = options;
        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          //Null and not empty are not same
          allQuestions.assignAll(questionPaper.questions!);
          currentSelectedQuestion.value =
              questionPaper.questions![0].question as Questions?;
          //print(questionPaper.questions![0].question);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        //debugging for developer mode as we cannot print statement in production mode
        print(e.toString());
      }
    }

    
  }
}
