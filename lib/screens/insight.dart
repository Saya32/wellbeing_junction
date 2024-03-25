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
  // List<String> historyQuizdocIDs = [];

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

  // Future getDocIDHistoryQuiz() async {
  //   await userCollection
  //       .doc(user.uid)
  //       .collection('myrecent_tests').doc()
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             print(element.reference);
  //             recentQuizdocIDs.add(element.reference.id);
  //           }));
  // }

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
                  }))
        ],
      )),
    );
  }
}
