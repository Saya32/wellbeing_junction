import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:wellbeing_junction/controllers/questionnaire/quiz_data_uploader_screen.dart';
import 'package:wellbeing_junction/firebase_options.dart';
import 'package:wellbeing_junction/auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initalise the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, //https://firebase.google.com/docs/flutter/setup?platform=ios
  );
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); //Initalise the firebase
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions
//         .currentPlatform, //https://firebase.google.com/docs/flutter/setup?platform=ios
//   );
//   // runApp(const MyApp());
//   // runApp(GetMaterialApp(home: QuizDataUploadScreen())); //used for uploading quiz data at backend
// }

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
