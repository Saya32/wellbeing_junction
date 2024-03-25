import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/controllers/questionnaire/completed_quiz_details.dart';
import 'package:wellbeing_junction/elements/background.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  // document IDs
  List<String> recentQuizdocIDs = [];
  List<String> historyQuizdocIDs = [];

  //get docIDs
  Future getDocIDRecentQuiz() async {
    await userCollection
        .doc(user.uid)
        .collection('myrecent_tests')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.reference);
              recentQuizdocIDs.add(element.reference.id);
            }));
  }

  Future getDocIDHistoryQuiz() async {
    await userCollection
        .doc(user.uid)
        .collection('myrecent_tests')
        .get()
        .then((recentTestsSnapshot) async {
      for (var recentTestDoc in recentTestsSnapshot.docs) {
        var quizId = recentTestDoc.id;
        await recentTestDoc.reference
            .collection('quiz_history')
            .get()
            .then((historySnapshot) {
          for (var historyDoc in historySnapshot.docs) {
            print(historyDoc.reference);
            historyQuizdocIDs.add(historyDoc.reference.id);
          }
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
              child: Text('Recent Quiz Completed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                              child: ListTile(
                                title: DisplayQuizData(
                                  documentId: recentQuizdocIDs[index],
                                ),
                                tileColor: Colors.deepOrange[200],
                              ),
                            );
                          });
                    })),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'History Quiz Completed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getDocIDHistoryQuiz(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: historyQuizdocIDs.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder<DocumentSnapshot>(
                          future: userCollection
                              .doc(user.uid)
                              .collection('myrecent_tests')
                              .doc(recentQuizdocIDs[index])
                              .collection('quiz_history')
                              .doc(historyQuizdocIDs[
                                  index]) // Assuming this is the correct document ID in quiz_history
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              Map<String, dynamic> data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${data['question_paper_title']}'),
                                      Text('Points: ${data['points']}'),
                                    ],
                                  ),
                                  tileColor: Colors.deepPurple[200],
                                ),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
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
