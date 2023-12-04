import 'package:flutter/material.dart';
import 'package:wellbeing_junction/elements/button.dart';
import 'package:wellbeing_junction/elements/textfield.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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

              const SizedBox(height: 10), //allows padding
              TextFieldElement(
                controller: confirmpasswordController,
                hinText: 'Confirm Password',
                obscureText: true,
              ),

              //Log in button
              const SizedBox(height: 20), //allows padding
              ButtonElement(onTap: () {}, text: "Sign Up"),

              //Take back to login screen
              const SizedBox(height: 10), //allows padding
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(
                          color: Colors.grey[700],
                        )),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.grey[700],
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        )
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
