// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
// import 'package:wellbeing_junction/models/normal_question_model.dart';

// class QuizPaperController extends GetxController {
//   final allPapers = <GeneralQuestionModel>[].obs;
//   final allPaperImages = <String>[].obs;
//   final selectedQuizIndex = 0.obs;

//   @override
//   void onReady() {
//     getAllPapers();
//     super.onReady();
//   }

//   Future<void> getAllPapers() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> data =
//           await questionnaireCollection.get();

//       final paperList = data.docs
//           .map((paper) => GeneralQuestionModel.fromSnapshot(paper))
//           .toList();

//       allPapers.assignAll(paperList);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> getQuestionsForSelectedQuiz() async {
//     if (allPapers.isNotEmpty) {
//       String quizId = allPapers[selectedQuizIndex.value].id;
//       try {
//         QuerySnapshot<Map<String, dynamic>> data = await questionnaireCollection
//             .doc(allPapers[selectedQuizIndex.value].id)
//             .collection('questions')
//             .get();

//         final questionList = data.docs
//             .map((question) => GeneralQuestionModel.fromSnapshot(question))
//             .toList();

//         allPapers[selectedQuizIndex.value]
//             .questions
//             ?.assignAll(questionList as Iterable<Questions>);
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
// }
