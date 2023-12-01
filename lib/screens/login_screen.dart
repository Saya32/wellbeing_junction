import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/divider.dart';
import 'package:wellbeing_junction/elements/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            const SizedBox(height: 20), //allows us to bring down our logo
            Image.asset('assets/images/logo.png', width: 180),

            // Greetings -  wellbeing Junction
            const SizedBox(height: 10), //allows padding
            const Text(
              'Welcome to Wellbeing Junction!',
              style: TextStyle(
                  color: Color.fromARGB(255, 210, 106, 228),
                  fontSize: 30,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.w800),
            ),

            //Email textfield
            const SizedBox(height: 20), //allows padding
            TextFieldElement(
              controller: emailController,
              hinText: 'Email',
              obscureText: false,
            ), //Call the method saved in elements folder to avoid repetion of UI text code

            //Password textfield
            const SizedBox(height: 20), //allows padding
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

            //Forget password?
            const SizedBox(height: 10), //allows padding
            Text(
              'Forget Password?',
              style: TextStyle(color: Colors.grey[700]),
            ),

            // Divider Element to allow userss sign in using alternative method
            const SizedBox(height: 10), //allows padding
            const DividerElement(),

            //Google authentication
            Row(children: [Image.asset('assets/images/google.jpg')])

            //Register as new members
          ]),
        )));
  }
}
