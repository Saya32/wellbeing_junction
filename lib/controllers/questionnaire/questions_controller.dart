import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class QuestionController extends GetxController {
  @override
  void onInit() {
    ever(currentSelectedQuestion, (_) {
      update(['options_lists']);
    });
    super.onInit();
  }

  @override
  void onReady() {
    final questionPaper = Get.arguments as GeneralQuestionModel?;
    if (questionPaper != null) {
      debugPrint("Title: ${questionPaper.title}");
      loadQuestionsDetails(questionPaper);
    } else {
      print("Something is wrong");
    }
    super.onReady();
  }

  late GeneralQuestionModel generalQuestionModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentSelectedQuestion =
      Rxn<Questions>(); // making the current questions observable
  final RxInt questionNumber = 0.obs;
  bool get firstQuestionNumber => questionNumber.value == 0;
  bool get lastQuestionNumber =>
      questionNumber.value >= allQuestions.length - 1;

  Future<void> loadQuestionsDetails(GeneralQuestionModel questionPaper) async {
    generalQuestionModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionsList =
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
                .doc(questionPaper.id)
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
          currentSelectedQuestion.value = questionPaper.questions![0];

          if (kDebugMode) {
            print(questionPaper.questions![0].options.length);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void selectedOption(String? answer) {
    currentSelectedQuestion.value!.selectedOption = answer;
    update(['options_lists']);
  }

  void nextQuestion() {
    if (questionNumber.value < allQuestions.length - 1) {
      questionNumber.value++;
      currentSelectedQuestion.value = allQuestions[questionNumber.value];
    }
  }

  void previousQuestion() {
    if (questionNumber.value > 0) {
      questionNumber.value--;
      currentSelectedQuestion.value = allQuestions[questionNumber.value];
    }
  }

// might not need tis code
  String get completedTest {
    final chosed = allQuestions
        .where((element) => element.selectedOption != null)
        .toList()
        .length;
    return '$chosed out of ${allQuestions.length} answered';
  }

// might not need tis code
  void complete() {
    Get.offAndToNamed("/");
  }
}
