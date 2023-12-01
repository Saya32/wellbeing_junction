import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/box.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/divider.dart';
import 'package:wellbeing_junction/elements/textfield.dart';

class SignUPPage extends StatelessWidget {
  SignUPPage({super.key});

  // Controllers for textfield
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign In User
  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            // Logo
            //const SizedBox(height: 40), //allows us to bring down our logo
            Image.asset('assets/images/logo.png', width: 200),

            //Email textfield
            const SizedBox(height: 10), //allows padding
            TextFieldElement(
              controller: emailController,
              hinText: 'Email',
              obscureText: false,
            ), //Call the method saved in elements folder to avoid repetion of UI text code

            //Password textfield
            const SizedBox(height: 10), //allows padding
            TextFieldElement(
              controller: passwordController,
              hinText: 'Password',
              obscureText: true,
            ),

            //Log in button
            const SizedBox(height: 20), //allows padding
            ButtonElement(
              onTap: signInUser,
            ),

            //Take back to login screen
            const SizedBox(height: 10), //allows padding
            Text(
              'Already have an account? Log In',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ]),
        )));
  }
}
