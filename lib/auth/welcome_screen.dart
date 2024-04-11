import 'package:flutter/material.dart';
import 'package:wellbeing_junction/screens/login_screen.dart';
import 'package:wellbeing_junction/screens/signup_screen.dart';

// Idea to switch page was inspired from Mitch Youtube tutorial --> https://www.youtube.com/watch?v=qlVj-0vpaW0&t=10s&ab_channel=MitchKoko

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // display login page
  bool displayLoginPage = true;

  //switch between sign up and login page
  void switchPages() {
    setState(() {
      displayLoginPage = !displayLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (displayLoginPage) {
      return LoginPage(onTap: switchPages);
    } else {
      return SignUpPage(onTap: switchPages);
    }
  }
}
