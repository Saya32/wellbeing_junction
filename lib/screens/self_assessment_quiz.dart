import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';
import 'package:wellbeing_junction/screens/quiz_detail_scree.dart';

class QuizListScreen extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();
  

  QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 239, 198, 251),
              Color.fromARGB(255, 231, 223, 183)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<QueryDocumentSnapshot>>(
          future: firebaseService.getQuizzes(),
          builder: (BuildContext context,
              AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error occurred'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No quizzes found'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var quiz =
                      snapshot.data?[index].data() as Map<String, dynamic>?;
                  if (quiz == null) {
                    // Handle null case
                    return const ListTile(
                      title: Text('Quiz data not available'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 160, 200, 232),
                            Color.fromARGB(255, 133, 181, 228)
                          ],
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          quiz['title'] ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${quiz['description']}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Total Number Of Questions: ${quiz['question_numbers']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        leading: Image.asset(
                          '${quiz['image_url']}' ?? 'assets/images/logo.png',
                          width: 50,
                          height: 50,
                        ),
                        onTap: () {
                          // Navigate to quiz details/questions screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizDetailsScreen(
                                  quizId: snapshot.data![index].id),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
