// Extend the questions controller to use the provided functions

import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

extension ResultControllerExtension on QuestionController {
  int normalCalculatePoint() {
    int totalPoints = 0;

    for (Questions question in allQuestions) {
      String? selectedOption = question.selectedOption;
      int points = int.tryParse(selectedOption ?? '0') ?? 0;
      totalPoints += points; //Pints are addded based n selected answer options
    }
    return totalPoints;
  }

  Map<String, int> calculatePointsPerCategoryForDass21() {
    Map<String, int> categoryPoints = {};
    for (Questions question in allQuestions) {
      String? category = question.category;
      category ??= ''; // If category is null
      categoryPoints[category] ??=
          0; // Initialize category points if not present
      String? selectedOption = question.selectedOption;
      int points = int.tryParse(selectedOption ?? '0') ?? 0;
      categoryPoints[category] =
          categoryPoints[category]! + points; //Add points per category
    }
    return categoryPoints;
  }

  String getScoreLevel(int totalPoints, String quizType) {
    if (quizType == 'bai') {
      if (totalPoints >= 0 && totalPoints <= 7) {
        return 'This quiz indicates you have Minimal Anxiety!';
      } else if (totalPoints >= 8 && totalPoints <= 15) {
        return 'This quiz indicates you have Mild Anxiety!';
      } else if (totalPoints >= 16 && totalPoints <= 25) {
        return 'This quiz indicates you have Moderate Anxiety!';
      } else {
        return 'This quiz indicates you have Severe Anxiety!';
      }
    } else if (quizType == 'bdi') {
      if (totalPoints >= 0 && totalPoints <= 9) {
        return 'This quiz indicates you have Minimal Depression!';
      } else if (totalPoints >= 10 && totalPoints <= 18) {
        return 'This quiz indicates you have Mild Depression!';
      } else if (totalPoints >= 19 && totalPoints <= 29) {
        return 'This quiz indicates you have Moderate Depression!';
      } else {
        return 'This quiz indicates you have Severe Depression!';
      }
    } else if (quizType == 'who5') {
      int totalpercentage = totalPoints * 4;
      if (totalpercentage >= 0 && totalpercentage <= 52) {
        return 'This quiz indicated s poor wellbeing and is an indication for testing for depression under ICD-10. Therefore, you are required to get medical help as soon as possible.';
      } else {
        return 'Maximal Well-being';
      }
    }

    return '';
  }
}
