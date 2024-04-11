import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String answer;
  final bool selected;
  final VoidCallback onTap;

  const AnswerTile({
    Key? key,
    required this.answer,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white, // White border color
            width: 5.0, // Border width
          ),
          color: selected
              ? const Color.fromARGB(255, 240, 228, 186)
              : const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Padding inside the border box
          child: Text(
            answer,
            style: TextStyle(
              color: selected
                  ? const Color.fromARGB(255, 37, 13, 216)
                  : Color.fromARGB(255, 0, 0, 0), // Black text color
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
