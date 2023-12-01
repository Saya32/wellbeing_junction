import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonElement extends StatelessWidget {
  const ButtonElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
            color: Colors.purple[200], borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text("Sign In",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))));
  }
}
