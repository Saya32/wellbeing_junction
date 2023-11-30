import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            // Logo
            const SizedBox(height: 30), //allows us to bring down our logo
            Image.asset('assets/images/logo.png', width: 200),

            // Greetings -  wellbeing Junction
            const SizedBox(height: 15), //allows padding
            Text(
              'Welcome to Wellbeing Junction!',
              style: TextStyle(
                  color: const Color.fromARGB(255, 211, 128, 226),
                  fontSize: 30,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.w800),
            ),

            //Email textfield
            const SizedBox(height: 30), //allows padding
            TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),

            //Password textfield
            const SizedBox(height: 30), //allows padding
            TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),

            //Forget password?
            const SizedBox(height: 30), //allows padding
            TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),

            //Log in button
            const SizedBox(height: 30), //allows padding
            TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            ),

            //Google authentication

            //Register as new members
          ]),
        )));
  }
}
