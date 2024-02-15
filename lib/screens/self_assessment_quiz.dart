import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questionnaire_controller.dart';
import 'package:wellbeing_junction/elements/quiz_tile.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/screens/dashboard_screen.dart';

class QuizPaperScreen extends StatefulWidget {
  const QuizPaperScreen({super.key});

  @override
  State<QuizPaperScreen> createState() => _QuizPaperScreen();
}

class _QuizPaperScreen extends State<QuizPaperScreen> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> streamQuiz;

  @override
  void initState() {
    super.initState();
    streamQuiz = RetrieveFirebaseQuiz().getQuizData();
  }

  Widget quizList() {
    return Container(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: streamQuiz,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: QuizTile(
                        noOfQuestions: snapshot.data!.docs.length,
                        imageUrl:
                            snapshot.data?.docs[index].data()['image_url'],
                        title: snapshot.data?.docs[index].data()['title'],
                        description:
                            snapshot.data?.docs[index].data()['description'],
                        quizID: snapshot.data!.docs[index].id,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: quizList(),
    );
  }
}
