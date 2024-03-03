import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
final questionnaireCollection = db.collection('selfAssessmentQuestionnaire');
final userCollection = db.collection('users');
final userDataCollection = db.collection('userData');

//create a new document collection based on previous collection id ==> needed during upoading JSON
DocumentReference questionReference({
  required String questionnaireId,
  required String questionId,
}) =>
    questionnaireCollection
        .doc(questionnaireId)
        .collection("questions")
        .doc(questionId);

DocumentReference recentQuizesData(
        {required String userId, required String questionnaireId}) =>
    userCollection
        .doc(userId)
        .collection('myrecent_quizes')
        .doc(questionnaireId);

CollectionReference<Map<String, dynamic>> recentQuizes(
        {required String userId}) =>
    userCollection.doc(userId).collection('myrecent_quizes');

CollectionReference<Map<String, dynamic>> getleaderBoard(
        {required String questionnaireId}) =>
    userDataCollection.doc(questionnaireId).collection('scores');

//May need to remove the below code when refactoring
class RetrieveFirebaseQuiz {
  Stream<QuerySnapshot<Map<String, dynamic>>> getQuizData() {
    return questionnaireCollection.snapshots();
  }
}
