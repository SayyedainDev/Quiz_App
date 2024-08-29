import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.QuizT, {super.key});

  final void Function() QuizT;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/quiz-logo.png",
          width: 250,
          color: const Color.fromARGB(123, 233, 227, 227),
        ),
        const SizedBox(
          height: 80,
        ),
        Text("Learn Flutter  the Fun way",
            style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white,
            )),
        OutlinedButton.icon(
          onPressed: QuizT,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        )
      ],
    ));
  }
}
