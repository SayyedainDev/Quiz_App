import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class result extends StatelessWidget {
  const result({super.key, required this.Answer});

  final String Answer;
  @override
  Widget build(context) {
    return Text(
      Answer,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 220, 146, 234),
          color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
