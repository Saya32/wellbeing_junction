import 'package:flutter/material.dart';

//Inspired by https://www.youtube.com/watch?v=Dh-cTQJgM-Q&t=896s&ab_channel=MitchKoko video

class TextFieldElement extends StatelessWidget {
  final TextEditingController
      controller; // access what users typed in the textfield
  final String hinText; // gives user a hint as to what to type in textfield
  final bool
      obscureText; //hides the characters when typing passport so boolean function

  const TextFieldElement(
      {super.key,
      required this.controller,
      required this.hinText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0.1),
      child: TextField(
        // style: TextStyle(height: 0.4),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
          hintText: hinText,
        ),
      ),
    );
  }
}
