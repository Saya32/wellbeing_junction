import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/firebase_questionnaire_collection/collections.dart';
import 'package:wellbeing_junction/models/normal_question_model.dart';

// Reference to code this section --> https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech

class QuizDataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
    var batch = fireStore.batch();

    for (var questionnaire in questionnaireTypes) {
      //loop through the types of questionnaires
      batch.set(questionnaireCollection.doc(questionnaire.id), {
        "title": questionnaire.title,
        "image_url": questionnaire.imageUrl,
        "description": questionnaire.description,
        "question_numbers": questionnaire.questions == null
            ? 0
            : questionnaire.questions!.length
      }); //ids of the JSON file
    }
    await batch.commit();
  }
}
