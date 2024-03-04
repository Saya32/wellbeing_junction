import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/controllers/questionnaire/questions_controller.dart';
import 'package:wellbeing_junction/firebase_options.dart';
import 'package:wellbeing_junction/auth/auth_screen.dart';

import 'controllers/questionnaire/questionnaire_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initalise the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, //https://firebase.google.com/docs/flutter/setup?platform=ios
  );
  Get.put(QuestionController());
  Get.put(QuizPaperController());

  /// Get.put(QuizPaperController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, //turns off the debug banner shown in app
      home: Authentication(),
    );
  }
}
