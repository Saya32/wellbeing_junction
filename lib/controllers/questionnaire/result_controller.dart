// Extend the questions controller to use the provided functions

import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

extension ResultControllerExtension on QuestionController {
  int normalCalculatePoint() {
    int totalPoints = 0;

    for (Questions question in allQuestions) {
      String? selectedOption = question.selectedOption;
      int points = int.tryParse(selectedOption ?? '0') ?? 0;

      // Add points based on the selected answer option
      totalPoints += points;
    }

    return totalPoints;
  }

  Map<String, int> calculatePointsPerCategoryForDass21() {
    Map<String, int> categoryPoints = {};

    for (Questions question in allQuestions) {
      String? category = question.category;
      category ??= ''; // Assign an empty string if category is null

      // Initialize category points if not present
      categoryPoints[category] ??= 0;

      String? selectedOption = question.selectedOption;
      int points = int.tryParse(selectedOption ?? '0') ?? 0;

      // Accumulate points for each category
      categoryPoints[category] = categoryPoints[category]! + points;
    }

    return categoryPoints;
  }
}
