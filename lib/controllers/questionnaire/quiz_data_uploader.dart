import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/update_status.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

// Inspiration of this code this section --> https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech

class QuizDataUploader extends GetxController {
  final updateStatus = UpdateStatus.updating.obs;

  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    try {
      updateStatus.value = UpdateStatus.updating;

      final contentManifest = await DefaultAssetBundle.of(Get.context!)
          .loadString("AssetManifest.json");
      final Map<String, dynamic> mapManifest = json.decode(contentManifest);
      final questionnairesInAsset = mapManifest.keys
          .where((path) =>
              path.startsWith("assets/questions") && path.contains(".json"))
          .toList();
      List<GeneralQuestionModel> questionnaireTypes = [];

      for (var questionnaire in questionnairesInAsset) {
        String questionnaireContent =
            await rootBundle.loadString(questionnaire);
        questionnaireTypes.add(
            GeneralQuestionModel.fromJson(json.decode(questionnaireContent)));
      }

      var batch = db.batch();
      for (var questionnaire in questionnaireTypes) {
        createQuestionnaireDocument(batch, questionnaire);
      }
      await batch.commit();
      updateStatus.value = UpdateStatus.completed;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void createQuestionnaireDocument(
      WriteBatch batch, GeneralQuestionModel questionnaire) {
    var questionnaireDocRef = questionnaireCollection.doc(questionnaire.id);
    batch.set(questionnaireDocRef, {
      "title": questionnaire.title,
      "image_url": questionnaire.imageUrl,
      "description": questionnaire.description,
      "question_numbers": questionnaire.questions?.length ?? 0,
    });

    questionnaire.questions?.forEach((question) {
      var questionDocRef =
          questionnaireDocRef.collection('questions').doc(question.id);
      batch.set(questionDocRef, {
        "question": question.question,
        "category": question.category,
      });

      question.options.forEach((option) {
        var optionDocRef =
            questionDocRef.collection('options').doc(option.points.toString());
        batch.set(optionDocRef, {"points": option.points, "text": option.text});
      });
    });
  }
}
