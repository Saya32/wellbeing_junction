// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  const TextFieldElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 204, 70, 231))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 234, 194, 241))),
        ),
      ),
    );
  }
}
