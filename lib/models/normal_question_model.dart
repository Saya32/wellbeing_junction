import 'package:cloud_firestore/cloud_firestore.dart';
// refrence: https://jsontodart.com/

class GeneralQuestionModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  List<Questions>? questions;

  GeneralQuestionModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.questions});

  GeneralQuestionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Options> options;

  Questions({required this.id, required this.question, required this.options});

  Questions.fromJson(Map<String, dynamic> json)
      : //with : the valu gets initialised before the constructor body runs
        id = json['id'],
        question = json['question'],
        options = (json['options'] as List)
            .map((e) => Options.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['options'] = options.map((v) => v.toJson()).toList();
    return data;
  }
}

class Options {
  String? text;
  int? points;

  Options({this.text, this.points});

  Options.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String?,
        points = int.tryParse(json['points'].toString());

  Options.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : text = snapshot['text'] as String?,
        points = snapshot['points'] as int?;

  Map<String, dynamic> toJson() => {'text': text, 'points': points};
}
