import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionnaireCollection =
    fireStore.collection('selfAssessmentQuestionnaire');

//create a new document collection based on previous collection id
DocumentReference questionReference({
  required String questionnaireId, 
  required String questionId,
}) =>
    questionnaireCollection
        .doc(questionnaireId)
        .collection("questions") 
        .doc(questionId);
