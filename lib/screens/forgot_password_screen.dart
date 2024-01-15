import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();

  void dispose() {
    // to prevent memory leaks
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      // Show success message or navigate user away from the page.
      showMessage("A password reset link has been sent to your email.");
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
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70), //allows padding
          Center(
            child: Text('Enter your email to receive reset password link'),
          ),
          const SizedBox(height: 20), //allows padding
          TextFieldElement(
            controller: emailController,
            hinText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 20),
          ButtonElement(
              onTap: resetPassword,
              text:
                  "Reset password"), //Call the method saved in elements folder to avoid repetion of UI text code
        ],
      ),
    );
  }
}
