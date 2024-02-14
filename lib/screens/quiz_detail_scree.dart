import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizDetailsScreen extends StatefulWidget {
  final String quizId;

  QuizDetailsScreen({required this.quizId});

  @override
  _QuizDetailsScreenState createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  late Stream<QuerySnapshot> _questionsStream;

  @override
  void initState() {
    super.initState();
    _questionsStream = FirebaseFirestore.instance
        .collection('selfAssessmentQuestionnaire')
        .doc(widget.quizId)
        .collection('questions')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _questionsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['question']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
