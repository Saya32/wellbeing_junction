import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeing_junction/app_routes.dart';
import 'package:wellbeing_junction/bindings.dart';
import 'package:wellbeing_junction/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initalise the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, //https://firebase.google.com/docs/flutter/setup?platform=ios
  );
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:
          false, //turns off the debug banner shown in app
      title: 'Mental Insight',
      getPages: AppScreenRoutes.screens(),
    );
  }
}
