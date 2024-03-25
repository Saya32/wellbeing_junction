//https://www.youtube.com/watch?v=PBxbWZZTG2Q&t=1224s&ab_channel=MitchKoko

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class DisplayQuizData extends StatelessWidget {
  final String documentId;
  final user = FirebaseAuth.instance.currentUser!;

  DisplayQuizData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    userCollection;
    return FutureBuilder<DocumentSnapshot>(
        future: userCollection
            .doc(user.uid)
            .collection('myrecent_tests')
            .doc(documentId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${data['question_paper_title']}'),
                Text('Score: ${data['points']}'),
                Text('${data['Score_level']}'),
                Text('Completed On: ${formatDate(data['date'].toString())}'),
              ],
            );
          }
          return Text('loading...');
        });
  }

  String formatDate(String dateString) {
    return '${dateString.substring(0, 4)}/${dateString.substring(4, 6)}/${dateString.substring(6)}';
  }
}

class DisplayHistoryQuizData extends StatelessWidget {
  final String documentId;

  DisplayHistoryQuizData({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // Assuming userCollection is defined somewhere globally or passed appropriately.
    final user = FirebaseAuth.instance.currentUser!;
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection(
                'users') // Update this path according to your Firestore structure
            .doc(user.uid)
            .collection('myrecent_tests') // And so on for the rest of the path
            .doc()
            .collection('quiz_history')
            .doc(documentId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${data['question_paper_title']}'),
                Text('Score: ${data['points']}'),
                Text('${data['Score_level']}'),
                Text('Completed On: ${formatDate(data['date'].toString())}'),
              ],
            );
          }
          return Text('loading...');
        });
  }

  String formatDate(String dateString) {
    return '${dateString.substring(0, 4)}/${dateString.substring(4, 6)}/${dateString.substring(6)}';
  }
}
