//https://www.youtube.com/watch?v=PBxbWZZTG2Q&t=1224s&ab_channel=MitchKoko

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/elements/date.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class DisplayQuizData extends StatelessWidget {
  final String documentId;
  final user = FirebaseAuth.instance.currentUser!;

  DisplayQuizData({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    userCollection;
    final Future<DocumentSnapshot<Map<String, dynamic>>> recentQuiz;
    return FutureBuilder<DocumentSnapshot>(
        future: recentQuiz = userCollection
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
                Text(
                  '${data['question_paper_title']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Score: ${data['points']}'),
                Text('${data['Score_level']}'),
                Text('Completed On: ${formatDate(data['date'].toString())}'),
              ],
            );
          }
          return const Text('loading...');
        });
  }
}
