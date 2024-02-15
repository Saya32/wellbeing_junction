import 'package:flutter/material.dart';
import 'package:wellbeing_junction/screens/quiz_detail_scree.dart';

class QuizTile extends StatelessWidget {
  final String imageUrl, title, description, quizID;
  final int noOfQuestions;

  QuizTile(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.noOfQuestions,
      required this.quizID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizDetailsScreen(quizId: quizID),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
