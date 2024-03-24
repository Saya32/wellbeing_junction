import 'package:flutter/material.dart';

class WarningText extends StatelessWidget {
  const WarningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 60.0,
              color: Color.fromARGB(255, 255, 0, 0),
            ), // Big red warning sign
            Text(
              'This self-assessment quiz doesn\'t replace medical needs but to provide insight',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 7, 2, 2), // Making the text red
                fontSize: 20.0, // Big text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
