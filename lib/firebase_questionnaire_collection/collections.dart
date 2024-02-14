import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference selfAssessmentCollection =
      FirebaseFirestore.instance.collection('selfAssessmentQuestionnaire');

  Future<List<QueryDocumentSnapshot>> getQuizzes() async {
    QuerySnapshot snapshot = await selfAssessmentCollection.get();
    return snapshot.docs;
  }
}

final fireStore = FirebaseFirestore.instance;
final questionnaireCollection =
    fireStore.collection('selfAssessmentQuestionnaire');

//create a new document collection based on previous collection id ==> needed during upoading JSON
DocumentReference questionReference({
  required String questionnaireId,
  required String questionId,
}) =>
    questionnaireCollection
        .doc(questionnaireId)
        .collection("questions")
        .doc(questionId);
