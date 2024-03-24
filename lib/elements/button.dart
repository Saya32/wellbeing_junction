import 'package:flutter/material.dart';

class ButtonElement extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const ButtonElement({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 130),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)))),
    );
  }
}

//https:docs.flutter.dev/release/breaking-changes/buttons
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: const Color.fromARGB(255, 240, 228, 186),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

//https:docs.flutter.dev/release/breaking-changes/buttons
final ButtonStyle blackButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: const Color.fromARGB(221, 255, 255, 255),
  backgroundColor: Color.fromARGB(255, 0, 0, 0),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);
