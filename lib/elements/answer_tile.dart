import 'package:flutter/material.dart';

enum AnswerStatus { answered, notanswered }

class AnswerTile extends StatelessWidget {
  final String answer;
  final bool selected;
  final VoidCallback onTap;
  const AnswerTile(
      {super.key,
      required this.answer,
      this.selected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selected
                ? const Color.fromARGB(255, 216, 108, 13)
                : const Color.fromARGB(255, 255, 255, 255)),
        child: Text(
          answer,
          style: TextStyle(
              color: selected
                  ? const Color.fromARGB(255, 216, 108, 13)
                  : const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
