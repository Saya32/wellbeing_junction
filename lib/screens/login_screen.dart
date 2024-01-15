import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/box.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/divider.dart';
import 'package:wellbeing_junction/elements/textfield.dart';
import 'package:wellbeing_junction/screens/forgot_password_screen.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for textfield
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showMessage("${e.message}");
    }
  }

  void showMessage(String message) {
    //display error to users
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            // Background(),
            // Logo
            const SizedBox(height: 40), //allows padding
            Image.asset('assets/images/logo.png', width: 100),

            //Email textfield
            const SizedBox(height: 70), //allows padding
            TextFieldElement(
              controller: emailController,
              hinText: 'Email',
              obscureText: false,
            ), //Call the method saved in elements folder to avoid repetion of UI text code

            //Password textfield
            const SizedBox(height: 25), //allows padding
            TextFieldElement(
              controller: passwordController,
              hinText: 'Password',
              obscureText: true,
            ),

            //Log in button
            const SizedBox(height: 20), //allows padding
            ButtonElement(onTap: signUserIn, text: "Log in"),

            //Forget password?
            const SizedBox(height: 10), //allows padding
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ForgetPassword();
                    },
                  ),
                );
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                    color: Colors.grey[700],
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Divider Element to allow userss sign in using alternative method
            const SizedBox(height: 40), //allows padding
            const DividerElement(),

            //Google authentication
            const SizedBox(height: 30), //allows padding
            const SquareBox(
                imagePath: 'assets/images/google.png',
                text: "Login with Google"),

            //Register as new members
            const SizedBox(height: 20), //allows padding
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Are you new here?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      )),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.grey[700],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ]),
        )));
  }
}
