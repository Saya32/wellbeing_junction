import 'package:flutter/material.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

class QuizTile extends StatelessWidget {
  const QuizTile({super.key, required this.model});

  final GeneralQuestionModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      model.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                          "assets/images/logo.png"), // Fallback image incase there is an error while loading images
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
                height: 15,
              ),
              Expanded(
                child: Column(children: [
                  Text(model.title),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(model.description),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
