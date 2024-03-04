import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
// refrence: https://jsontodart.com/

class GeneralQuestionModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  List<Questions>? questions;
  int questionNumbers;

  GeneralQuestionModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.questionNumbers,
      required this.questions});

  factory GeneralQuestionModel.fromString(String jsonString) =>
      GeneralQuestionModel.fromJson(json.decode(jsonString));

  GeneralQuestionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'] as String,
        questionNumbers = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  GeneralQuestionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        imageUrl = snapshot['image_url'],
        description = snapshot['description'],
        questionNumbers = snapshot['question_numbers'] as int,
        questions = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['description'] = description;
    return data;
  }
}

class Questions {
  String id;
  String question;
  String? category;
  String? selectedOption;
  List<Options> options;

  Questions(
      {required this.id,
      required this.question,
      required this.category,
      required this.options});

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        category = snapshot['category'],
        options = [];

  Questions.fromJson(Map<String, dynamic> json)
      : //with : the valu gets initialised before the constructor body runs
        id = json['id'],
        question = json['question'],
        category = json['category'],
        options = (json['options'] as List)
            .map((e) => Options.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['category'] = category;
    data['options'] = options.map((v) => v.toJson()).toList();
    return data;
  }
}

class Options {
  final String text;
  final int? points;

  Options({required this.text, required this.points});

  Options.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String,
        points = int.tryParse(json['points'].toString());

  Options.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : text = snapshot['text'] as String,
        points = snapshot['points'] as int?;

  Map<String, dynamic> toJson() => {'text': text, 'points': points};
}
