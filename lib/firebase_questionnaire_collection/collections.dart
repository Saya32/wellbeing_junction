import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
final questionnaireCollection = db.collection('selfAssessmentQuestionnaire');

//create a new document collection based on previous collection id ==> needed during upoading JSON
DocumentReference questionReference({
  required String questionnaireId,
  required String questionId,
}) =>
    questionnaireCollection
        .doc(questionnaireId)
        .collection("questions")
        .doc(questionId);

class RetrieveFirebaseQuiz {
  Stream<QuerySnapshot<Map<String, dynamic>>> getQuizData() {
    return questionnaireCollection.snapshots();
  }

  // getQuestionData(String quizId) async{
  //   return await db
  //       .collection("selfAssessmentQuestionnaire")
  //       ..doc(quizId)
  //       .collection("questions")
  //       .doc(individualquestionID)
  //       .getDocuments();
  // }
}
