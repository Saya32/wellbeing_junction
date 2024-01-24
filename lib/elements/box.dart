import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final String text;
  const SquareBox({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(0, 0, 0, 1),
                border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1))),
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  height: 20,
                ),
                const SizedBox(width: 20.0),
                Text(text,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            )));
  }
}
