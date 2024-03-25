import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;
final questionnaireCollection = db.collection('selfAssessmentQuestionnaire');
final userCollection = db.collection('users');


//create a new document collection based on previous collection id ==> needed during upoading JSON
DocumentReference questionReference({
  required String questionnaireId,
  required String questionId,
}) =>
    questionnaireCollection
        .doc(questionnaireId)
        .collection("questions")
        .doc(questionId);

CollectionReference<Map<String, dynamic>> recentTests(
        {required String userUId}) =>
    userCollection.doc(userUId).collection('myrecent_tests');
