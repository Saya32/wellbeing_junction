import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/update_status.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

// Reference to code this section --> https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech

class QuizDataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final updateStatus = UpdateStatus.updating.obs; // the status of updating is observerable

  Future<void> uploadData() async {
    updateStatus.value = UpdateStatus.updating;

    final fireStore = FirebaseFirestore.instance; //send data to backend
    final contentManifest = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> mapManifest = json.decode(contentManifest);
    final questionnairesInAsset = mapManifest.keys
        .where((path) =>
            path.startsWith("assets/questions") && path.contains(".json"))
        .toList(); //load the path as a file name
    List<GeneralQuestionModel> questionnaireTypes = [];
    for (var questionnaire in questionnairesInAsset) {
      String questionnaireContent = await rootBundle.loadString(questionnaire);
      questionnaireTypes.add(GeneralQuestionModel.fromJson(json.decode(
          questionnaireContent))); //json.decode takes string and converts it to map
    }

    for (var questionnaire in questionnaireTypes) {
      var batch = fireStore.batch();
      //loop through the types of questionnaires
      batch.set(questionnaireCollection.doc(questionnaire.id), {
        //creates collections and related documents
        "title": questionnaire.title,
        "image_url": questionnaire.imageUrl,
        "description": questionnaire.description,
        "question_numbers": questionnaire.questions == null
            ? 0
            : questionnaire.questions!.length
      });
      //create questions for each of the documents
      for (var questions in questionnaire.questions!) {
        final questionTrack = questionReference(
            questionnaireId: questionnaire.id, questionId: questions.id);
        batch.set(questionTrack, {
          "question": questions.question,
          // "options": questions.options,
          "category": questions.category,
        });

        //Last sub collection will be option as it's final list
        for (var options in questions.options) {
          batch.set(
              questionTrack
                  .collection("options")
                  .doc(options.points.toString()),
              {"points": options.points, "text": options.text});
        }
      }
      await batch.commit();
      updateStatus.value = UpdateStatus.completed;
    }
  }
}
