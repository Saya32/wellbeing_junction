import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/controllers/questionnaire/completed_quiz_details.dart';
import 'package:wellbeing_junction/elements/date.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> recentQuizdocIDs = [];
  List<Map<String, dynamic>> historyQuizData = [];

  //get docIDs
  Future<void> getDocIDRecentQuiz() async {
    recentQuizdocIDs.clear();
    await userCollection
        .doc(user.uid)
        .collection('myrecent_tests')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.reference);
              recentQuizdocIDs.add(element.reference.id);
            }));
  }

  // Fetch and store quiz history data
  Future<void> fetchQuizHistoryData() async {
    historyQuizData.clear(); // Clear previous data
    await userCollection
        .doc(user.uid)
        .collection('myrecent_tests')
        .get()
        .then((recentTestsSnapshot) async {
      for (var recentTestDoc in recentTestsSnapshot.docs) {
        final historySnapshot =
            await recentTestDoc.reference.collection('quiz_history').get();

        historySnapshot.docs.forEach((historyDoc) {
          final quizData = historyDoc.data();
          historyQuizData.add({
            'title': quizData['question_paper_title'],
            'points': quizData['points'],
            'score_level': quizData['Score_level'],
            'date': quizData['date'],
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent Quiz Completed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getDocIDRecentQuiz(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: recentQuizdocIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color.fromARGB(255, 240, 187, 137),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: DisplayQuizData(
                                documentId: recentQuizdocIDs[index],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Previous Quiz Completed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchQuizHistoryData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: historyQuizData.length,
                      itemBuilder: (context, index) {
                        final quiz = historyQuizData[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: const Color.fromARGB(255, 238, 154, 154),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    quiz['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Score: ${quiz['points']}'),
                                  Text('${quiz['score_level']}'),
                                  Text(
                                      'Completed On: ${formatDate(quiz['date'].toString())}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
