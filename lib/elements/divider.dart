// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DividerElement extends StatelessWidget {
  const DividerElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.purple[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Or Use', style: TextStyle(color: Colors.purple[500])),
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.purple[200],
            ),
          ),
        ],
      ),
    );
  }
}
