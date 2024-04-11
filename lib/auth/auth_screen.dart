import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/auth/welcome_screen.dart';
import 'package:wellbeing_junction/screens/app_introduction_screen.dart';

// Use of offical firebase document to implement authStateChanges function --> https://firebase.google.com/docs/auth/flutter/start

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //if user is logged in then we will direct them to dashboard
            return const AppIntroductionScreen();
          } else {
            return const WelcomePage(); // else they will be in welcome page
          }
        },
      ),
    );
  }
}
