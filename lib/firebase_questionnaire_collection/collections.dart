import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionnaireCollection =
    fireStore.collection('Self-Assessment Questionnaire');
