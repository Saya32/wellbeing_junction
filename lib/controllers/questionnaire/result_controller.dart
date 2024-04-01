// Extend the questions controller to use the provided functions
//https://www.youtube.com/watch?v=pxsKvudZpOQ&ab_channel=ProgrammingPoint refrence for mapping used in result_controller

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/auth/auth_service.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
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
        return 'This quiz indicates you have Moderate Anxiety! Please refer to our anxiety section in our extra tips page for more help.';
      } else {
        return 'This quiz indicates you have Severe Anxiety! Please refer to our anxiety section in our extra tips page for more help.';
      }
    } else if (quizType == 'bdi') {
      if (totalPoints >= 0 && totalPoints <= 9) {
        return 'This quiz indicates you have Minimal Depression!';
      } else if (totalPoints >= 10 && totalPoints <= 18) {
        return 'This quiz indicates you have Mild Depression! Please refer to our depression section in our extra tips page for more help.';
      } else if (totalPoints >= 19 && totalPoints <= 29) {
        return 'This quiz indicates you have Moderate Depression! Please refer to our depression section in our extra tips page for more help.';
      } else {
        return 'This quiz indicates you have Severe Depression! Please refer to our depression section in our extra tips page for more help.';
      }
    } else if (quizType == 'swls') {
      if (totalPoints >= 5 && totalPoints <= 9) {
        return 'This quiz indicates you are extremely dissatisfied with your life! Please refer to our general help section in our Extra Tips page for more advice.';
      } else if (totalPoints >= 10 && totalPoints <= 14) {
        return 'This quiz indicates you are dissatisfied with your life! Please refer to our general help section in our Extra Tips page for more advice.';
      } else if (totalPoints >= 15 && totalPoints <= 19) {
        return 'This quiz indicates you are slightly dissatisfied with your life! Please refer to our general help section in our Extra Tips page for more advice.';
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
        return 'This quiz indicates you have high perceived stress! Please refer to our stress section in our Extra Tips page for more advice.';
      }
    } else if (quizType == 'gad7') {
      if (totalPoints >= 0 && totalPoints <= 4) {
        return 'This quiz indicates you have No Anxiety!';
      } else if (totalPoints >= 5 && totalPoints <= 9) {
        return 'This quiz indicates you have Mild Anxiety! Please refer to our anxiety section in our extra tips page for more help.';
      } else if (totalPoints >= 10 && totalPoints <= 14) {
        return 'This quiz indicates you have Moderate level of Anxiety! Please refer to our anxiety section in our extra tips page for more help.';
      } else {
        return 'This quiz indicates you have Severe Anxiety! Please refer to our anxiety section in our extra tips page for more help.';
      }
    } else if (quizType == 'who5') {
      int totalpercentage = totalPoints * 4;
      if (totalpercentage >= 0 && totalpercentage <= 52) {
        return 'This quiz indicates poor wellbeing, please refer to our extra advice and tips page for more help.';
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
      depressionLevel =
          'Severe! Please refer to our depression section in our extra tips page for more help.';
    } else {
      depressionLevel =
          'Extremely Severe! Please refer to our depression section in our extra tips page for more help.';
    }

    String anxietyLevel;
    if (anxietyPoints <= 3) {
      anxietyLevel = 'Normal';
    } else if (anxietyPoints <= 5) {
      anxietyLevel = 'Mild';
    } else if (anxietyPoints <= 7) {
      anxietyLevel = 'Moderate';
    } else if (anxietyPoints <= 9) {
      anxietyLevel =
          'Severe! Please refer to our anxiety section in our extra tips page for more help.';
    } else {
      anxietyLevel =
          'Extremely Severe! Please refer to our anxiety section in our extra tips page for more help.';
    }

    String stressLevel;
    if (stressPoints <= 7) {
      stressLevel = 'Normal';
    } else if (stressPoints <= 9) {
      stressLevel = 'Mild';
    } else if (stressPoints <= 12) {
      stressLevel = 'Moderate';
    } else if (stressPoints <= 16) {
      stressLevel =
          'Severe! Please refer to our stress section in our extra tips page for more help.';
    } else {
      stressLevel =
          'Extremely Severe! Please refer to our stress section in our extra tips page for more help.';
    }

    return {
      'Depression': depressionLevel,
      'Anxiety': anxietyLevel,
      'Stress': stressLevel,
    };
  }

  Future<void> saveQuizResult({required String navigateTo}) async {
    var batch = db.batch();
    User? user = Get.find<AuthService>().getUser();
    if (user == null) return;
    String formattedTodayDate = DateFormat('yyyyMMdd').format(DateTime.now());

    int normalPoints = normalCalculatePoint();
    Map<String, int>? dass21Points;
    String scoreLevel = getScoreLevel(normalPoints, generalQuestionModel.id);
    Map<String, String> dass21ScoreLevels;

    // Reference to user's recent test document
    DocumentReference recentTestDocReference = userCollection
        .doc(user.uid)
        .collection('myrecent_tests')
        .doc(generalQuestionModel.id);

    // Reference to the specific day's document within quiz_history
    DocumentReference dayDocReference = recentTestDocReference
        .collection('quiz_history')
        .doc(formattedTodayDate);

    // Check if there's already a record for today
    DocumentSnapshot dayDocSnapshot = await dayDocReference.get();

    Map<String, dynamic> quizResultData = {
      "points": normalPoints,
      "question_paper_id": generalQuestionModel.id,
      "question_paper_title": generalQuestionModel.title,
      "Score_level": scoreLevel,
      "date": formattedTodayDate // Add date to quiz result data
    };

    // Check if quiz is DASS-21 or not
    if (generalQuestionModel.id == 'dass21') {
      dass21Points = calculatePointsPerCategoryForDass21();
      dass21ScoreLevels = getDass21ScoreLevels(dass21Points);
      quizResultData.addAll({
        "dss21_points": dass21Points,
        "score_level_dss21": dass21ScoreLevels,
      });
    }

    if (!dayDocSnapshot.exists) {
      batch.set(dayDocReference, quizResultData);
    } else {
      batch.update(dayDocReference, quizResultData);
    }
    // Update the recent test document with the latest result data
    batch.set(recentTestDocReference, quizResultData);

    await batch.commit();

    if (navigateTo == 'insight') {
      navigateToInsight();
    } else if (navigateTo == 'advice') {
      navigateToAdviceScreen();
    }
  }
}
