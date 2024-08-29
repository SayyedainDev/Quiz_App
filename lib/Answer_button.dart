import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  const Answer({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 47, 2, 98),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ));
  }
}
