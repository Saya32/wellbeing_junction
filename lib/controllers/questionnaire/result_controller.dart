// Extend the questions controller to use the provided functions
//https://www.youtube.com/watch?v=pxsKvudZpOQ&ab_channel=ProgrammingPoint refrence for mapping used in result_controller

import 'package:flutter/material.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

extension ResultControllerExtension on QuestionController {
  int normalCalculatePoint() {
    int totalPoints = 0;

    for (Questions question in allQuestions) {
      String? selectedOption = question.selectedOption;
      int points = int.tryParse(selectedOption ?? '0') ?? 0;
      totalPoints +=
          points; //Points are addded based on selected answer options
    }
    return totalPoints;
  }

  Map<String, int> calculatePointsPerCategoryForDass21() {
    Map<String, int> categoryPoints = {};
    for (Questions question in allQuestions) {
      String? category = question.category;
      category ??= ''; // If category is null
      categoryPoints[category] ??=
          0; // Initialize category points if not present to 0
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
    } else if (quizType == 'swls') {
      if (totalPoints >= 5 && totalPoints <= 9) {
        return 'This quiz indicates you are extremely dissatisfied with your life!';
      } else if (totalPoints >= 10 && totalPoints <= 14) {
        return 'This quiz indicates you are dissatisfied with your life!';
      } else if (totalPoints >= 15 && totalPoints <= 19) {
        return 'This quiz indicates you are slightly dissatisfied with your life!';
      } else if (totalPoints == 20) {
        return 'This quiz indicates you are Neutal with the level of satisfaction with life!';
      } else if (totalPoints >= 21 && totalPoints <= 25) {
        return 'This quiz indicates you are slightly satisfied with your life!';
      } else if (totalPoints >= 26 && totalPoints <= 30) {
        return 'This quiz indicates you are satisfied with your life!';
      } else {
        return 'This quiz indicates you are extremely satisfied with your life!';
      }
    } else if (quizType == 'pss') {
      if (totalPoints >= 0 && totalPoints <= 13) {
        return 'This quiz indicates you have low level of stress!';
      } else if (totalPoints >= 14 && totalPoints <= 26) {
        return 'This quiz indicates you have moderate level of stress!';
      } else {
        return 'This quiz indicates you have  high perceived stress!';
      }
    } else if (quizType == 'gad7') {
      if (totalPoints >= 0 && totalPoints <= 4) {
        return 'This quiz indicates you have No Anxiety!';
      } else if (totalPoints >= 5 && totalPoints <= 9) {
        return 'This quiz indicates you have Mild Anxiety!';
      } else if (totalPoints >= 10 && totalPoints <= 14) {
        return 'This quiz indicates you have Moderate level of Anxiety!';
      } else {
        return 'This quiz indicates you have Severe Anxiety!';
      }
    } else if (quizType == 'who5') {
      int totalpercentage = totalPoints * 4;
      if (totalpercentage >= 0 && totalpercentage <= 52) {
        return 'This quiz indicated poor wellbeing and is an indication for testing for depression under ICD-10. Therefore, you are required to get medical help as soon as possible.';
      } else {
        return 'Maximal Well-being';
      }
    }

    return '';
  }

  Map<String, String> getDass21ScoreLevels(Map<String, int> categoryPoints) {
    final depressionPoints = categoryPoints['d']!;
    final anxietyPoints = categoryPoints['a']!;
    final stressPoints = categoryPoints['s']!;

    String depressionLevel;
    if (depressionPoints <= 4) {
      depressionLevel = 'Normal';
    } else if (depressionPoints <= 6) {
      depressionLevel = 'Mild';
    } else if (depressionPoints <= 10) {
      depressionLevel = 'Moderate';
    } else if (depressionPoints <= 13) {
      depressionLevel = 'Severe';
    } else {
      depressionLevel = 'Extremely Severe';
    }

    String anxietyLevel;
    if (anxietyPoints <= 3) {
      anxietyLevel = 'Normal';
    } else if (anxietyPoints <= 5) {
      anxietyLevel = 'Mild';
    } else if (anxietyPoints <= 7) {
      anxietyLevel = 'Moderate';
    } else if (anxietyPoints <= 9) {
      anxietyLevel = 'Severe';
    } else {
      anxietyLevel = 'Extremely Severe';
    }

    String stressLevel;
    if (stressPoints <= 7) {
      stressLevel = 'Normal';
    } else if (stressPoints <= 9) {
      stressLevel = 'Mild';
    } else if (stressPoints <= 12) {
      stressLevel = 'Moderate';
    } else if (stressPoints <= 16) {
      stressLevel = 'Severe';
    } else {
      stressLevel = 'Extremely Severe';
    }

    return {
      'Depression': depressionLevel,
      'Anxiety': anxietyLevel,
      'Stress': stressLevel,
    };
  }
}
